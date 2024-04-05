import 'package:flutter/material.dart';
import 'package:inss_validator/config/helpers/screen_size.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize(context).height * 0.35,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(14, 61, 97, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_pin_rounded,
            size: 120.0,
            color: Colors.white,
          ),
          Text(
            'Employee Validator',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
