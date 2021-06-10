import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Text("TAG",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 30,
                    fontWeight: FontWeight.w500))));
  }
}
