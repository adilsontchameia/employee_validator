import 'package:flutter/material.dart';
import 'package:inss_validator/api/google_sheets_api.dart';
import 'package:inss_validator/data/staff_details.dart';

class ValidateInssProvider extends ChangeNotifier {
  bool _isLoading = false;
  StafDetails? staffDetails;
  int? id;
  String? name;
  String? position;
  String? code;
  String? cashPaidStaff;
  String? startDate;
  String? birthDate;
  String? idNumbers;
  String? inssNum;
  String? category;
  String? gender;
  String? bloodType;
  String? location;
  String? municipality;
  String? dutyOcation;
  String? teamSection;
  String? opsWadSupport;
  String? donor;
  int? baseSalary = 0;

  Future validateInss(int inss) async {
    try {
      isLoading = true;
      final staff = await GoogleSheetApi.getById(inss);
      name = staff!.name;
      position = staff.position;
      code = staff.code;
      cashPaidStaff = staff.cashPaidStaff;
      startDate = staff.startDate;
      birthDate = staff.birthDate;
      idNumbers = staff.idNumbers;
      inssNum = staff.inssNum;
      category = staff.category;
      gender = staff.gender;
      bloodType = staff.bloodType;
      location = staff.location;
      municipality = staff.municipality;
      dutyOcation = staff.dutyOcation;
      teamSection = staff.teamSection;
      opsWadSupport = staff.opsWadSupport;
      donor = staff.donor;
      baseSalary = staff.baseSalary;
    } finally {
      isLoading = false;
    }
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
