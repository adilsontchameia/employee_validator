import 'package:flutter/material.dart';
import 'package:inss_validator/providers/validate_inss_provider.dart';
import 'package:inss_validator/screen/validation_screen/validation_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const HaloInssValidator());
}

class HaloInssValidator extends StatelessWidget {
  const HaloInssValidator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider(
          create: (context) => ValidateInssProvider(),
          child: const QueryInformationScreen()),
    );
  }
}
