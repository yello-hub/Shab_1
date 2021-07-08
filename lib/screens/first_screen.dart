// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shab/screens/detail_screen.dart';
import '../models/Instagram.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xff336633),
        title:
            Image.asset('assets/images/Asset_15.png', height: 100, width: 100),
      ),
      body: Container(color: const Color(0xff336633), child: MainListExample()),
    );
  }
}

class MainListExample extends StatefulWidget {
  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainListExample> {
  @override
  initState() {
    //초기화
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Instagram>>(
        future: Instagram.fetchInstagrams(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Instagram instagram = snapshot.data[0];
            return Center(
                child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                print(instagram);
                return Container(
                  height: 100,
                  width: 400,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(3.0, 3.0), blurRadius: 5.0)
                      ]),
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height / 5),
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/instar_logo.png',
                                height: 25, width: 25),
                            TextButton(
                              child: Text('자세히'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            snapshot.data[index])));
                              },
                            )
                          ]),
                      SizedBox(height: 30),
                      Text(
                        '${snapshot.data[index].title}',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "AppleSD",
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ));
          } else if (snapshot.hasData) {
            return Text("$snapshot.error}");
          }

          return CircularProgressIndicator();
        });
  }
}
