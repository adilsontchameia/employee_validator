import 'package:flutter/material.dart';
import 'package:inss_validator/features/staff_validation/infrasctructure/infrasctructure.dart';

import '../../domain/domain.dart';

class StaffProvider extends ChangeNotifier {
  final StaffRepository repository;
  StaffProvider({required this.repository});

  Staff _staff = Staff();
  Staff get staff => _staff;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _erroMessage = '';
  String get message => _erroMessage;

  Future<void> validate(int id) async {
    isLoading = true;

    try {
      notifyListeners();
      final retrievedStaff = await repository.getById(id);

      _staff = retrievedStaff!;
      _erroMessage = '';
      isLoading = false;
    } on NotFound {
      isLoading = false;
      _erroMessage = 'Not found';
    } catch (e) {
      isLoading = false;
      throw Exception();
    }
  }
}
