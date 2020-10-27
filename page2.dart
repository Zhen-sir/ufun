import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyPage1.dart';

class Page2 extends StatefulWidget implements MyPage1 {
  Page2({Key key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();

  @override
  // TODO: implement appBar
  AppBar get appBar {
    return AppBar(
      title: Text('Page2'),
    );
  }
}

class _Page2State extends State<Page2> {
  MyDatetime now = new MyDatetime();
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 10), (Timer timer) { 
      //这个异步体现在在这一秒钟，你可以进行其它操作
      //这个periodic有两个函数方法，第一个是一秒执行一次的duration方法，第二个是自定义的参数是timer的方法
      //会先执行initstate 且执行一次，但是由于initstate里面有peridodic方法所以这个periodic会按照一秒一次的周期执行
      //每次执行到setstate的时候会触发build方法，然后就会进入到bulid方法里面打印时间
      try {
        setState(() {
         now =new MyDatetime();

        });                   //这个异常是怎么捕获的？

      }catch(a){              //这个a是实参，会自动转化成dynamic类型
        timer.cancel();       //当page2被切换的时候page2并不会自己停止运行，所以当它被切换的时候要取消
      }
     /* if (timer == null) {
        timer.cancel();
      } else {
        setState(() {
          now = new MyDatetime();
        });
      }*/
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('当前时间'), Text(now.timeStr)],
      ),
    ));
  }
}

class MyDatetime extends DateTime {
  MyDatetime() : super.now();
  // 获取时间字符串
  get timeStr {
    // 处理父类的int字段来得到字符串
    var yearStr = _toStringAndPad(year, 4);
    var monthStr = _toStringAndPad(month);
    var dayStr = _toStringAndPad(day);
    var hourStr = _toStringAndPad(hour);
    var minuteStr = _toStringAndPad(minute);
    var secondStr = _toStringAndPad(second);
    return '$yearStr-$monthStr-$dayStr $hourStr:$minuteStr:$secondStr';
  }

  // 将数字 number 转为字符串, 再左补0补齐到 width 位
  String _toStringAndPad(int number, [int width = 2]) =>
      number.toString().padLeft(width, '0');
}
