import 'package:flutter/material.dart';
import 'package:inss_validator/utils/screen_proportion.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    super.key,
  });
  final ScreenProportion proportion = ScreenProportion();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: proportion.screenSize(context).height * 0.35,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(14, 61, 97, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100.0),
          ),
        ),
      ),
      Positioned(
        bottom: proportion.screenSize(context).height * 0.030,
        left: proportion.screenSize(context).width * 0.060,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('INSS VALIDATOR',
                style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text(
                'Please check the last sync date in order to retrieve the lastest updates.',
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      Image.asset(
        'assets/HaloLogoWhite.png',
        height: proportion.screenSize(context).height * 0.32,
        width: proportion.screenSize(context).height * 0.28,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back,
                    color: Colors.white, size: 40)),
            Row(
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.home,
                            color: Colors.white, size: 35)),
                    const Text('Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(width: 20.0),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings,
                            color: Colors.white, size: 35)),
                    const Text('Settings',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
