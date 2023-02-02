import 'package:flutter/material.dart';

class ValidateInssProvider extends ChangeNotifier {
  final TextEditingController pin1 = TextEditingController();
  final TextEditingController pin2 = TextEditingController();
  final TextEditingController pin3 = TextEditingController();
  final TextEditingController pin4 = TextEditingController();
  int inss = 0000;

  void validateInss(int pin1, int pin2, int pin3, int pin4) {
    inss = pin1 + pin2 + pin3 + pin4;
    //debugPrint('Insurance Number: $inss');

    notifyListeners();
  }
}
