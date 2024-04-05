import 'dart:developer';

import 'package:gsheets/gsheets.dart';
import 'package:inss_validator/config/config.dart';
import 'package:inss_validator/config/consts/app_consts.dart';
import 'package:inss_validator/features/staff_validation/infrasctructure/infrasctructure.dart';

import '../../domain/domain.dart';
import '../mappers/staff_mapper.dart';

class StaffDataSourceImpl extends StaffDataSource {
  StaffDataSourceImpl() {
    initGoogleSheets();
  }

  static Worksheet? _userSheet;

  static Future initGoogleSheets() async {
    final gsheet = GSheets(Environment.googleConsoleCredential);
    try {
      final Spreadsheet spreadsheet =
          await gsheet.spreadsheet(Environment.docID);
      _userSheet =
          await _getSheet(spreadsheet, title: AppConsts.spreadsheetTitle);
    } catch (e) {
      log('Spread Sheet Error: $e');
    }
  }

  static Future<Worksheet> _getSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      //Will create the spreadsheet if it does not exists.
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      //If it's created will shall work normally.
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  @override
  Future<Staff?> getById(int id) async {
    try {
      if (_userSheet == null) throw NotFound();
      final response = await _userSheet!.values.map.rowByKey(id, fromColumn: 1);
      if (response == null) {
        throw NotFound();
      }
      final staff = StaffMapper.staffJsonToEntity(response);
      return staff;
    } on NotFound {
      throw NotFound(message: 'Doc not found');
    }
  }
}
