import 'package:flutter/material.dart';
import 'package:inss_validator/data/employee_data.dart';
import 'package:inss_validator/models/employee_model.dart';
import 'package:inss_validator/screen/validation_screen/widgets/body_title_subtitle.dart';
import 'package:inss_validator/screen/validation_screen/widgets/header_widget.dart';
import 'package:inss_validator/screen/validation_screen/widgets/otp_widget.dart';
import 'package:inss_validator/screen/validation_screen/widgets/search_button.dart';
import 'package:inss_validator/screen/validation_screen/widgets/table_query_result.dart';
import 'package:inss_validator/utils/screen_proportion.dart';

class QueryInformationScreen extends StatefulWidget {
  const QueryInformationScreen({
    super.key,
  });

  @override
  State<QueryInformationScreen> createState() => _QueryInformationScreenState();
}

class _QueryInformationScreenState extends State<QueryInformationScreen> {
  final ScreenProportion proportion = ScreenProportion();
  final TextEditingController pin1 = TextEditingController();
  final TextEditingController pin2 = TextEditingController();
  final TextEditingController pin3 = TextEditingController();
  final TextEditingController pin4 = TextEditingController();
  late List<User> users;

  @override
  void initState() {
    super.initState();
    users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: proportion.screenSize(context).height * 0.030,
                    horizontal: proportion.screenSize(context).width * 0.010),
                child: const BodyTitleAndSubtitle(),
              ),
              SizedBox(height: proportion.screenSize(context).height * 0.01),
              OTPFields(pin1: pin1, pin2: pin2, pin3: pin3, pin4: pin4),
              SizedBox(height: proportion.screenSize(context).height * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: proportion.screenSize(context).height * 0.030,
                    horizontal: proportion.screenSize(context).width * 0.010),
                child: const QueryResultAndTable(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: proportion.screenSize(context).width * 0.030,
                    vertical: proportion.screenSize(context).height * 0.07),
                child: SearchButton(
                    pin1: pin1, pin2: pin2, pin3: pin3, pin4: pin4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
