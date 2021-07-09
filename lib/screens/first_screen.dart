// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shab/screens/detail_screen.dart';
import '../models/Instagram.dart';
import 'package:flutter/services.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        toolbarHeight: 100,
        backgroundColor: Color(0xFF41775D),
        title: Image.asset('assets/images/Asset_15.png', height: 100, width: 100),
        elevation: 0,
      ),
      body: Container(color: const Color(0xff41775D), child: MainListExample()),
    );
  }
}

class MainListExample extends StatefulWidget {
  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainListExample> {
  final pageController = PageController(viewportFraction: 1.1);
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Instagram>>(
        future: Instagram.fetchInstagrams(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, int index) {
                  Instagram instagram = snapshot.data[index];
                  return Container(
                    // height: 100,
                    padding: EdgeInsets.fromLTRB(24, 23, 24, 23),
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(3.0, 3.0), blurRadius: 5.0)
                        ]
                      ),
                    // constraints: BoxConstraints(
                        // minHeight: MediaQuery.of(context).size.height / 5),
                    margin: const EdgeInsets.only(left: 13, right: 13, bottom: 24),
                    child: Column(
                      children: [
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Image.asset('assets/images/${instagram.getDomain()}', height: instagram.getDomainHeight(), width: instagram.getDomainWidth()),
                              ),
                              Expanded(
                                child: SizedBox(width: 8),
                              ),
                              Expanded(
                                flex: 10,
                                child: instagram.getTagWidget(),
                              ),

                              // TextButton(
                              //   child: Text('자세히'),
                              //   onPressed: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => DetailScreen(
                              //                 snapshot.data[index])));
                              //   },
                              // )
                            ]),
                        SizedBox(height: 10),
                            AspectRatio(
                              aspectRatio: 1/1,
                              child: PageView.builder(
                                // controller: PageController(initialPage: instagram.pictures.length),
                                controller: pageController,
                                itemCount: instagram.pictures.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return FractionallySizedBox(
                                    widthFactor: 1 / pageController.viewportFraction,
                                    child: Image.network(
                                      instagram.pictures[index].url,
                                      fit: BoxFit.fitWidth,
                                      alignment: FractionalOffset.topCenter,
                                      //height: double.infinity,
                                      //width: double.infinity,
                                      //fit: BoxFit.fitWidth),
                                    )
                                  );
                                  // return Center(
                                  //   child: Image.network(
                                  //     instagram.pictures[index].url,
                                  //     fit: BoxFit.fitWidth,
                                  //     alignment: FractionalOffset.topCenter,
                                  //     //height: double.infinity,
                                  //     //width: double.infinity,
                                  //     //fit: BoxFit.fitWidth),
                                  //
                                  // ));
                                },
                              ),
                            ),
                        SizedBox(height: 10),
                        Text(
                          instagram.getTitle(),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "AppleSD",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          instagram.getContent(),
                        ),
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
