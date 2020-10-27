import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MyPage1.dart';

class Page1 extends StatelessWidget implements MyPage1 {      //mypage1变为stateful之后，page1也要边
  @override
  AppBar get appBar {
    return AppBar(
      title: Text('hello flutter'),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      home: Scaffold(
        body: Homecenter(),
      ),
    );
  }

 
  
}

class Homecenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int a;
    Random r = new Random();
    a = r.nextInt(1000);
    return Center(
      child: Text(
        "Hello $a",
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}
