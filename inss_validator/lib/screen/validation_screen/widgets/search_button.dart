import 'package:flutter/material.dart';
import 'package:inss_validator/providers/validate_inss_provider.dart';
import 'package:inss_validator/utils/screen_proportion.dart';
import 'package:provider/provider.dart';

class SearchButton extends StatelessWidget {
  SearchButton({
    super.key,
    required this.pin1,
    required this.pin2,
    required this.pin3,
    required this.pin4,
  });

  final ScreenProportion proportion = ScreenProportion();
  final TextEditingController pin1;
  final TextEditingController pin2;
  final TextEditingController pin3;
  final TextEditingController pin4;

  @override
  Widget build(BuildContext context) {
    final queryResult = context.watch<ValidateInssProvider>();
    return SizedBox(
        height: proportion.screenSize(context).height * 0.045,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(14, 61, 97, 1)),
            onPressed: () {
              queryResult.validateInss(
                  int.parse(pin1.text),
                  int.parse(pin2.text),
                  int.parse(pin3.text),
                  int.parse(pin4.text));
            },
            child: const Text('Search',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))));
  }
}
