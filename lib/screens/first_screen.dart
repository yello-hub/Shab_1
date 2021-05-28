import 'package:flutter/material.dart';

//
import '../models/Stadium.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('First Screen'),
      // ),
      // body: Center(
      //     child: ElevatedButton(
      //         child: Text('Launch screen'),
      //         onPressed: () {
      //           new Future.delayed(const Duration(seconds: 3), () {
      //             Navigator.pushNamed(context, '/detail');
      //           });
      //         })),
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
    return FutureBuilder<List<Stadium>> (
      future: Stadium.fetchStadiums(),
      builder: (context, snapshot) {
      if (snapshot.hasData) {
        Stadium stadium = snapshot.data[0];
        return Center(
          child: Text(stadium.name),
          //응답 받은 데이터로 UI 그리기
        );
      }

      return CircularProgressIndicator();
      }
    );
  }
}
