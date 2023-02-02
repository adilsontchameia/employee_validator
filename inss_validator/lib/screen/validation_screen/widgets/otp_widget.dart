import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  gapPadding: 20,
  borderSide: const BorderSide(color: Color.fromRGBO(14, 61, 97, 1)),
);

final inputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
  border: inputBorder,
  focusedBorder: inputBorder,
  enabledBorder: inputBorder,
);

class OTPFields extends StatefulWidget {
  final TextEditingController pin1;
  final TextEditingController pin2;
  final TextEditingController pin3;
  final TextEditingController pin4;

  const OTPFields({
    Key? key,
    required this.pin1,
    required this.pin2,
    required this.pin3,
    required this.pin4,
  }) : super(key: key);

  @override
  State<OTPFields> createState() {
    return _OTPFieldsState();
  }
}

class _OTPFieldsState extends State<OTPFields> {
  FocusNode? pin1FN;
  FocusNode? pin2FN;
  FocusNode? pin3FN;
  FocusNode? pin4FN;

  final pinStyle = const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    pin1FN = FocusNode();
    pin2FN = FocusNode();
    pin3FN = FocusNode();
    pin4FN = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FN?.dispose();
    pin2FN?.dispose();
    pin3FN?.dispose();
    pin4FN?.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                  controller: widget.pin1,
                  autofocus: true,
                  style: pinStyle,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: inputDecoration,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                  ],
                  onChanged: (value) {
                    nextField(value, pin2FN!);
                  },
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                  controller: widget.pin2,
                  focusNode: pin2FN,
                  style: pinStyle,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: inputDecoration,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                  ],
                  onChanged: (value) => nextField(value, pin3FN!),
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                  controller: widget.pin3,
                  focusNode: pin3FN,
                  style: pinStyle,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: inputDecoration,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                  ],
                  onChanged: (value) => nextField(value, pin4FN!),
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                    controller: widget.pin4,
                    focusNode: pin4FN,
                    style: pinStyle,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: inputDecoration,
                    onChanged: (value) => pin4FN!.unfocus()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
