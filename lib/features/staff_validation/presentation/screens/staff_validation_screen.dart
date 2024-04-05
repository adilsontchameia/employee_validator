import 'package:flutter/material.dart';
import 'package:inss_validator/config/helpers/screen_size.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../../../../config/consts/app_consts.dart';
import '../providers/staff_validation_provider.dart';
import '../widgets/widgets.dart';

class StaffValidationScreen extends StatefulWidget {
  const StaffValidationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StaffValidationScreen> createState() => _StaffValidationScreenState();
}

class _StaffValidationScreenState extends State<StaffValidationScreen> {
  OtpFieldController otpController = OtpFieldController();
  int inss = 0;

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: const TextStyle(fontSize: 20.0)),
      backgroundColor: AppConsts.primaryColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StaffProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenSize(context).height * 0.05,
                    horizontal: screenSize(context).width * 0.05,
                  ),
                  child: Text(
                    'INSERT THE EMPLOYEE CODE BELOW TO GET ALL INFORMATION.',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppConsts.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                OTPTextField(
                    controller: otpController,
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 55,
                    fieldStyle: FieldStyle.box,
                    style: TextStyle(
                        fontSize: 20,
                        color: AppConsts.primaryColor,
                        fontWeight: FontWeight.bold),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    onChanged: (pin) {
                      inss = int.parse(pin);
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenSize(context).height * 0.030,
                    horizontal: screenSize(context).width * 0.010,
                  ),
                  child: const _Table(),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: _CustomButton(
                      onTap: provider.isLoading
                          ? null
                          : () {
                              if (inss < 4) {
                                return showSnackbar(
                                    context, 'Please fill all fields');
                              } else {
                                provider.validate(inss);
                              }
                            },
                      color: provider.isLoading
                          ? Colors.grey
                          : AppConsts.primaryColor,
                      title: provider.isLoading ? 'Searching...' : 'Search',
                    )),
                const SizedBox(height: 10.0),
                Text(
                  provider.message.isEmpty ? '' : provider.message,
                  style: TextStyle(
                    color: provider.message.isEmpty ? Colors.white : Colors.red,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final Function()? onTap;
  final Color color;
  final String title;
  const _CustomButton({
    required this.onTap,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45.0,
        width: double.infinity,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: color,
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ));
  }
}

class _Table extends StatefulWidget {
  const _Table();

  @override
  State<_Table> createState() => _TableState();
}

class _TableState extends State<_Table> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StaffProvider>(builder: (context, result, _) {
      return DataTable(
        columns: const [
          DataColumn(
            label: Text('ID'),
          ),
          DataColumn(
            label: Text('Name'),
          ),
          DataColumn(
            label: Text('Role'),
          ),
          DataColumn(
            label: Text('Location'),
          ),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text(result.staff.id ?? '0')),
            DataCell(Text(result.staff.name ?? 'None')),
            DataCell(Text(result.staff.position ?? 'None')),
            DataCell(Text(result.staff.location ?? 'None')),
          ]),
        ],
        dividerThickness: 2,
        dataRowMaxHeight: 50,
        dataTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20.0,
        ),
        dataRowColor: MaterialStateProperty.resolveWith(
            (states) => const Color.fromARGB(255, 220, 240, 255)),
        showBottomBorder: true,
        headingTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15.0),
        headingRowColor: MaterialStateProperty.resolveWith(
            (states) => AppConsts.primaryColor),
      );
    });
  }
}
