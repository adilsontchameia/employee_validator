import '../domain.dart';

abstract class StaffDataSource {
  Future<Staff?> getById(int id);
}
