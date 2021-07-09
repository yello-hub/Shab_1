import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

class Picture {
  final int id;
  final String post_id;
  final String url;

  Picture({this.id, this.post_id, this.url});


  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: json['id'],
      post_id: json['post_id'],
      url: json['url'],
    );
  }
}

class Tag {
  final int id;
  final String post_id;
  final String tag;

  Tag({this.id, this.post_id, this.tag});
  
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      post_id: json['post_id'],
      tag: json['tag'],
    );
  }
}

class Instagram {
  // final int id;
  // final String pictures;
  // final String tags;

  final List<Tag> tags;
  final List<Picture> pictures;

  final String domain;
  final String title;
  final String content;

  // productList: list.map((element) => Product.fromJson(element)).toList(),


  String getTitle() {
    //return if (title == null) ? "-" : title;
    return title == null ? "-" : title;
  }

  String getContent() {
    return content == null ? "-" : content;
  }

  String getDomain() {
    if (domain == 'instagram') {
      return "instar_logo.png";
    } else {
      return "naver_logo.png";
    }
  }

  double getDomainWidth() {
    if (domain == 'instagram') {
      return 35.03;
    } else {
      return 34.58;
    }
  }

  double getDomainHeight() {
    if (domain == 'instagram') {
      return 34.48;
    } else {
      return 33;
    }
  }

  Widget getTagWidget() {
    List<Container> tagList = List<Container>();
    for (int i = 0; i<tags.length; i++) {
      tagList.add(
        Container(
          //color: Color(0xFFFFE073),
          decoration: BoxDecoration(
            color: Color(0xFFFFE073),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(left:2),
          child: Text(
            tags[i].tag,
          ),
        ),
      );
    }
    //return Row(
      //children: tagList,
    //);
    return Wrap(
      children: tagList,
      //spacing: 10,
      runSpacing: 4,
    );

    //return ListView(
      //scrollDirection: Axis.horizontal,
      //children: tagList,
    //);
  }

  // Instagram({this.pictures, this.tags, this.domain, this.title, this.content});
  Instagram({this.tags, this.pictures, this.domain, this.title, this.content});

  static Future<List<Instagram>> fetchInstagrams() async {
    //요청주소
    //String url = "http://letsego.site/api/v1/hash-post/";
    String url = "http://letsego.site/api/v1/hash-post/?page=5";

    //요청 조건을 보낼 때
    Map<String, String> headers = {};

    //응답
    final response = await http.get(url, headers: headers);

    //응답이 성공했을 경우
    if (response.statusCode == 200) {
      //한글 디코딩
      final decodeData = utf8.decode(response.bodyBytes);

      //json 디코딩
      Map obj = jsonDecode(decodeData);

      //json to list
      List list = obj['results'];

      //list to model
      var stadiumList =
          list.map((element) => Instagram.fromJson(element)).toList();

      //응답
      return stadiumList;
    }
  }

  factory Instagram.fromJson(Map<String, dynamic> json) {
    List pictureList = json.containsKey('pictures') ? json['pictures'] : [];
    List tagList = json.containsKey('tags') ? json['tags'] : [];

    return Instagram(
        pictures: pictureList.map((element) => Picture.fromJson(element)).toList(),
        tags: tagList.map((element) => Tag.fromJson(element)).toList(),
        domain: json['domain'],
        title: json['title'],
        content: json['content']);
  }
}
