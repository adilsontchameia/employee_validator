import 'package:flutter/material.dart';
import 'package:inss_validator/utils/screen_proportion.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.proportion,
  });

  final ScreenProportion proportion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: proportion.screenSize(context).height * 0.045,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(14, 61, 97, 1)),
            onPressed: () {},
            child: const Text('Search',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))));
  }
}
