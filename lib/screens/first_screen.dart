import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
          child: ElevatedButton(
              child: Text('Launch screen'),
              onPressed: () {
                new Future.delayed(const Duration(seconds: 3), () {
                  Navigator.pushNamed(context, '/detail');
                });
              })),
    );
  }
}
