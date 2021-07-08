// import 'dart:ffi';
import 'package:flutter/material.dart';
// import 'package:shab/models/Stadium.dart';
import '../models/Instagram.dart';

class DetailScreen extends StatelessWidget {
  final Instagram instagram;
  DetailScreen(this.instagram);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Color(0xff336633),
        title:
            Image.asset('assets/images/Asset_15.png', height: 100, width: 100),
      ),
      body: Container(
        child: Text(instagram.title),
      ),
    );
  }
}

// class Stadium {
//   final int id;
//   final String name;
//
//   Stadium(this.id, this.name);
// }
