import 'package:flutter/material.dart';

class ScreenProportion {
  Size screenSize(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return size;
  }
}
