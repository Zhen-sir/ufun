import 'package:flutter/material.dart';
import 'MyPage1.dart';

class Page3 extends StatefulWidget implements MyPage1 {
  Page3({Key key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();

  @override
  // TODO: implement appBar
  AppBar get appBar {
    return AppBar(
      title: Text('page3'),
    );
  }
}

class _Page3State extends State<Page3> {
  String s1 = " ";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "请输入你的名字",
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
        Container(
            width: 200, //容器如果不设置宽高就不会生成容器

            child: Center(
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    s1 = value;
                  });
                },
              ),
            )),
        Center(
            child: Container(
          height: 100,
          child: Text(
            'Hello${ ' '+s1[0][0].toUpperCase() + s1.substring(1).toLowerCase()}',
            style: TextStyle(color: Colors.blue, fontSize: 40),
          ),
        ))
      ],
    );
  }
}


