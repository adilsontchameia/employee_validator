import '../domain.dart';

abstract class StaffRepository {
  Future<Staff?> getById(int id);
}
