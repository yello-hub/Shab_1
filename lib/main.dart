import 'package:flutter/material.dart';
import 'screens/first_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/first': (context) => FirstScreen(),
      '/detail': (context) => DetailScreen()
    },
  ));
}
