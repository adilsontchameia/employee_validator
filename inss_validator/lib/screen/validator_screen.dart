import 'package:flutter/material.dart';

class QueryInformationScreen extends StatelessWidget {
  const QueryInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(14, 61, 97, 1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100.0)))),
              Positioned(
                bottom: 20,
                left: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('VALIDATION',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text(
                        'This is an example.This is an example.This is an example.This is an example.This is an example.This is an example.',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Image.asset(
                'assets/HaloLogoWhite.png',
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.60,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white, size: 30)),
                    Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.home,
                                    color: Colors.white)),
                            const Text('Home',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.settings,
                                    color: Colors.white)),
                            const Text('Settings',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
