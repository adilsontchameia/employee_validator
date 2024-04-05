import 'package:inss_validator/features/staff_validation/infrasctructure/datasources/staff_validation_datasource_impl.dart';

import '../../domain/domain.dart';

class StaffRepositoryImpl implements StaffRepository {
  final StaffDataSource dataSource;

  StaffRepositoryImpl({StaffDataSource? dataSource})
      : dataSource = dataSource ?? StaffDataSourceImpl();

  @override
  Future<Staff?> getById(int id) {
    return dataSource.getById(id);
  }
}
