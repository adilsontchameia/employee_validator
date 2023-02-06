import 'package:flutter/material.dart';
import 'package:inss_validator/providers/validate_inss_provider.dart';
import 'package:inss_validator/screen/staff_validation_screen/widgets/body_title_subtitle.dart';
import 'package:inss_validator/screen/staff_validation_screen/widgets/header_widget.dart';
import 'package:inss_validator/screen/staff_validation_screen/widgets/table_query_result.dart';
import 'package:inss_validator/utils/screen_proportion.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class StaffValidationScreenScreen extends StatefulWidget {
  const StaffValidationScreenScreen({
    super.key,
  });

  @override
  State<StaffValidationScreenScreen> createState() =>
      _StaffValidationScreenScreenState();
}

class _StaffValidationScreenScreenState
    extends State<StaffValidationScreenScreen> {
  final ScreenProportion proportion = ScreenProportion();

  OtpFieldController otpController = OtpFieldController();
  int inss = 0000;
  @override
  Widget build(BuildContext context) {
    final queryResult = context.watch<ValidateInssProvider>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (queryResult.isLoading) const LinearProgressIndicator(),
              HeaderWidget(imgUrl: 'assets/profile_pic.jpg'),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: proportion.screenSize(context).height * 0.030,
                    horizontal: proportion.screenSize(context).width * 0.010),
                child: const BodyTitleAndSubtitle(),
              ),
              SizedBox(height: proportion.screenSize(context).height * 0.01),
              OTPTextField(
                  controller: otpController,
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 70,
                  fieldStyle: FieldStyle.box,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(14, 61, 97, 1),
                      fontWeight: FontWeight.bold),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  onChanged: (pin) {
                    inss = int.parse(pin);
                  }),
              SizedBox(height: proportion.screenSize(context).height * 0.01),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: proportion.screenSize(context).height * 0.030,
                      horizontal: proportion.screenSize(context).width * 0.010),
                  child: QueryResultAndTable()),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: proportion.screenSize(context).width * 0.030,
                    vertical: proportion.screenSize(context).height * 0.01),
                child: SizedBox(
                    height: proportion.screenSize(context).height * 0.045,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(14, 61, 97, 1)),
                        onPressed: queryResult.isLoading
                            ? null
                            : () {
                                queryResult.validateInss(inss);
                              },
                        child: queryResult.isLoading
                            ? const Text('Searching...',
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold))
                            : const Text('Search',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold)))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
