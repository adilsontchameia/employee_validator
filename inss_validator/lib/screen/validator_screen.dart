import 'package:flutter/material.dart';

class QueryInformationScreen extends StatelessWidget {
  const QueryInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(14, 61, 97, 1),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100.0)))),
            Image.asset(
              'assets/HaloLogoWhite.png',
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 0.60,
            ),
          ]),
        ],
      ),
    );
  }
}
