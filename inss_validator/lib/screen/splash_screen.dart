import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 61, 97, 1),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('version 1.0',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  )),
            ),
            Center(child: Image.asset('assets/HaloLogoWhite.png')),
          ],
        ),
      ),
    );
  }
}
