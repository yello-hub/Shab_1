// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shab/screens/detail_screen.dart';
// import 'package:shab/screens/detail_screen.dart';
import '../models/Stadium.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.lightGreen[900],
        title:
            Image.asset('assets/images/Asset_15.png', height: 100, width: 100),
      ),
      body: MainListExample(),
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
    return FutureBuilder<List<Stadium>>(
        future: Stadium.fetchStadiums(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Stadium stadium = snapshot.data[0];
            return Center(
                child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                print(stadium);

                // return ListView(children: <Widget>[
                //new Container(
                //  decoration: new BoxDecoration(color: Colors.black),
                //   child: new
                return ListTile(
                    contentPadding: EdgeInsets.all(100.0),
                    title: Text("s"),
                    // title: Image.network(
                    //   '${snapshot.data[index].cover}',
                    //   fit: BoxFit.fill,
                    // ),
                    subtitle: Text('${snapshot.data[index].name}'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(snapshot.data[index])));
                    });
              },
            ));
          } else if (snapshot.hasData) {
            return Text("$snapshot.error}");
          }
          //응답 받은 데이터로 UI 그리기

          return CircularProgressIndicator();
        });
  }
}
