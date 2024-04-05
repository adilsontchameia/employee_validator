import 'package:flutter/material.dart';
import 'package:inss_validator/features/staff_validation/infrasctructure/repositories/staff_repository_impl.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'features/staff_validation/presentation/providers/providers.dart';
import 'features/staff_validation/presentation/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.initEnvironment();
  runApp(const HaloInssValidator());
}

class HaloInssValidator extends StatelessWidget {
  const HaloInssValidator({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StaffProvider(repository: StaffRepositoryImpl()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StaffValidationScreen(),
      ),
    );
  }
}
