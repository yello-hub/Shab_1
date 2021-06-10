// import 'dart:ffi';
import 'package:flutter/material.dart';
// import 'package:shab/models/Stadium.dart';
import '../models/Stadium.dart';

class DetailScreen extends StatelessWidget {
  final Stadium stadium;
  DetailScreen(this.stadium);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stadium.name),
      ),
      body: Container(
        child: Text(stadium.name),
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
