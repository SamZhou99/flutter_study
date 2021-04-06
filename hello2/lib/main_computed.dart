import 'package:flutter/material.dart';
import 'dart:math';

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPage();
  }
}

class MainPage extends State<Main> {
  String tempStr = 'Loading...';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print('dispost');
  }

  void onClickBtn() {
    print('click');
    int n1 = 10+Random().nextInt(20);
    int n2 = Random().nextInt(9);
    int n3 = max(n1, n2);
    int n4 = min(n1, n2);
    int n5 = n3 - n4;
    setState(() {
      // tempStr = n1.toString() + '+' + n2.toString() + '= ?';
      tempStr = "${n3.toString()}-${n4.toString()}=${n5.toString()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            color: Colors.teal,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    tempStr,
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  RaisedButton(child: Text('Click'), onPressed: onClickBtn)
                ],
              ),
            ),
          ),
        ));
  }
}

void main() {
  runApp(new Main());
}
