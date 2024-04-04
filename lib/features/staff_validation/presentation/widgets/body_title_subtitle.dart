import 'package:flutter/material.dart';

class BodyTitleAndSubtitle extends StatelessWidget {
  const BodyTitleAndSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Text(
        'INSERT THE INSS BELOW IN ORDER TO GET ALL INFORMATION.',
        style: TextStyle(
            fontSize: 35,
            color: Color.fromRGBO(14, 61, 97, 1),
            fontWeight: FontWeight.bold),
      ),
      Text(
        'IF YOU WANT TO GET THE INFORMATION ON TEXT FORMAT JUST ON TAP ON COPY BUTTON.',
        style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 100, 98, 98),
            fontWeight: FontWeight.bold),
      ),
    ]);
  }
}
