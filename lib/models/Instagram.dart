import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Instagram {
  // final int id;
  final String tag;
  final String date;
  final int like;
  final int unlike;
  final String url;
  final String category;

  Instagram(
      {
      // this.id,
      this.tag,
      this.date,
      this.like,
      this.unlike,
      this.url,
      this.category});

  static Future<List<Instagram>> fetchInstagrams() async {
    //요청주소
    String url = "http://www.letsego.site/api/v1/post-instagram/";

    //요청 조건을 보낼 때
    Map<String, String> headers = {};

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
      var stadiumList =
          list.map((element) => Instagram.fromJson(element)).toList();

      //응답
      return stadiumList;
    }
  }

  factory Instagram.fromJson(Map<String, dynamic> json) {
    return Instagram(
        // id: json['id'],
        tag: (json['content'] == null) ? "-" : json['content'],
        date: json['created_date'],
        like: json['is_good_count'],
        unlike: json['is_bad_count'],
        url: json['url'],
        category: json['category']);
  }
}
