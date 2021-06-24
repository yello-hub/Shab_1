import 'package:flutter/material.dart';
import 'screens/first_screen.dart';
//import 'screens/detail_screen.dart';
import 'screens/splash_screen.dart';

// 오류를 수정하고 푸시 해야지ㅋㅋ
// 몇가지

/*

  몇가지 수정하고 푸시 했습니다
  뭐가 수정됐고 왜 문제가 있었는지 파악 해보세요
  DetailScreen에 경기장 이미지 추가 하세요

*/

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Named routes Demo',
    initialRoute: '/first',
    routes: {
      '/': (context) => SplashScreen(),
      '/first': (context) => FirstScreen(),
      // '/detail': (context) => DetailScreen()
    },
  ));
}
