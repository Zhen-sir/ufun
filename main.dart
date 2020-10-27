import 'package:flutter/material.dart';
import 'page2.dart';
import 'page1.dart';
import 'page3.dart';
import 'MyPage1.dart';

void main() {
  runApp(MyApp()); //通过runapp方法可以调用flutter的组件   所有组件都是类
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'asdfasdf', //这个title是什么
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentindex = 1;
  // Page1 page =new Page1();
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements

    List<MyPage1> _pages = [Page1(), Page2(), Page3()];

    return MaterialApp(
      home: Scaffold(
        appBar: _pages[currentindex].appBar,
        body: _pages[currentindex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this.currentindex,
          onTap: (int index) {
            setState(() {
            //  print('$index');
              this.currentindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.nature), title: Text('page1')),
            BottomNavigationBarItem(
                icon: Icon(Icons.nature), title: Text('page2')),
            BottomNavigationBarItem(
                icon: Icon(Icons.nature), title: Text('page3'))
          ],
        ),
      ),
    );
  }
}

// class MyhomePage extends StatelessWidget {
//   Widget build(BuildContext context) {
//     var page = Page1();
//     return Scaffold(
//       appBar: page.appBar,
//       body: page,
//     );
//   }
// }
