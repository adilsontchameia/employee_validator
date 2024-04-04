import 'package:flutter/material.dart';

class ScreenProportion {
  Size screenSize(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return size;
  }
}
