import 'package:flutter/material.dart';
import 'package:inss_validator/config/helpers/screen_proportion.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    super.key,
    required this.imgUrl,
  });
  final ScreenProportion proportion = ScreenProportion();
  final String imgUrl;

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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(
          'assets/HaloLogoWhite.png',
          height: proportion.screenSize(context).height * 0.32,
          width: proportion.screenSize(context).height * 0.28,
        ),
        /*
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                  margin: const EdgeInsets.only(top: 35),
                  height: proportion.screenSize(context).height * 0.22,
                  width: proportion.screenSize(context).height * 0.22,
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 5,
                    color: Colors.white,
                  )),
                  //child: const Placeholder())
                  child: Container())
              
              Image.asset(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            */
      ]),
      Positioned(
        right: 0,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        const MenuBar(children: [Text('data')]);
                      },
                      icon: const Icon(Icons.settings,
                          color: Colors.white, size: 35)),

                  // PopupMenuButton<MenuValues>(
                  //   onSelected: (value) {
                  //     switch (value) {
                  //       case MenuValues.Language:
                  //         //TODO
                  //         print('Select Language');
                  //         break;
                  //       case MenuValues.About:
                  //         //TODO
                  //         print('About the APP');
                  //         break;

                  //       default:
                  //     }
                  //   },
                  //   itemBuilder: (BuildContext context) => [
                  //     const PopupMenuItem(
                  //       value: MenuValues.Language,
                  //       child: Text('Language'),
                  //     ),
                  //     const PopupMenuItem(
                  //       value: MenuValues.About,
                  //       child: Text('About'),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
