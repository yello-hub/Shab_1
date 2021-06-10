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

        // 이건 0번째(코딩에서 리스트는 0번부터 시작함) 리스트를 불러오는 코드입니다
        Stadium stadium = snapshot.data[0];
        print(stadium.name);

        // 이건 1번째 리스트를 불러오는 코드 입니다
        Stadium stadium1 = snapshot.data[1];
        print(stadium1.name);

        // 이건 fetchStadiums() 로 불러온 리스트를 for문을 활용해 순차적으로 불러오는 코드 입니다
        for (int i=0; i<snapshot.data.length; i++) {
          Stadium stadium = snapshot.data[i];
          print(stadium.name);
        }

        // 세가지를 참고해서
        // ListView를 구성해보세요


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
