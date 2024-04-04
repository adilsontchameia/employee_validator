import 'package:gsheets/gsheets.dart';

import '../domain.dart';

abstract class StaffValidationDataSource {
  Future<Worksheet> getWorkSheet();
  Future<Staff> getById(String id);
  Future<List<Staff>> getAll(String token);
}
