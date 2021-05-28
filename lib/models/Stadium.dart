import 'package:http/http.dart' as http;
import 'dart:convert';

class Stadium {
  final int id;
  final String name;
  final int size_x;
  final int size_y;

  Stadium({
    this.id,
    this.name,
    this.size_x,
    this.size_y,
  });

  static Future<List<Stadium>> fetchStadiums() async {


    //요청주소
    String url = "https://plabfootball.com/api/v2/stadium-groups/";

    //요청 조건을 보낼 때
    Map<String, String> headers = {

    };

    //응답
    final response = await http.get(url, headers: headers);
    print(response.statusCode);

    //응답이 성공했을 경우
    if (response.statusCode == 200) {
      //한글 디코딩
      final decodeData = utf8.decode(response.bodyBytes);

      //json 디코딩
      Map obj = jsonDecode(decodeData);

      //json to list
      List list = obj['results'];
      print(list);

      //list to model 
      var stadiumList = list.map((element) => Stadium.fromJson(element)).toList();
      
      //응답
      return stadiumList;

    }
  }


  factory Stadium.fromJson(Map<String, dynamic> json) {
    return Stadium(
      id: json['id'],
      name: (json['name'] == null) ? "-" : json['name'],
      size_x: json['size_x'],
      size_y: json['size_y'],
    );
  }
}
