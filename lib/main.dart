import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/staff_validation/presentation/providers/providers.dart';
import 'features/staff_validation/presentation/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Environment.initEnvironment();
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
        debugShowCheckedModeBanner: false,
        home: StaffValidationScreen(),
      ));
}
