import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/first');
    });

    return Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/Asset_16.png',
            height: 50,
            width: 50,
          ),
        ));
  }
}
