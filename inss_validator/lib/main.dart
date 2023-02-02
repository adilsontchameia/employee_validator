import 'package:flutter/material.dart';
import 'package:inss_validator/providers/validate_inss_provider.dart';
import 'package:inss_validator/screen/validation_screen/validation_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  runApp(const HaloInssValidator());
}

class HaloInssValidator extends StatelessWidget {
  const HaloInssValidator({super.key});

  @override
  Widget build(BuildContext context) => Provider(
      lazy: true,
      create: (context) => ValidateInssProvider(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: QueryInformationScreen()));
}
