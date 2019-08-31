import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

///App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const TITLE = '这是标题';
    return new MaterialApp(
      title: TITLE,
      home: MyHomePage(),
    );
  }
}

///首页框架
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.imgUrl}) : super(key: key);
  final String imgUrl;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

///首页结构
class _MyHomePageState extends State {
  final rootUrl = 'http://www.3fantizi.com/article/pic/';
  List imgList = ['TX11083_01.jpg', 'TX11083_02.jpg', 'TX11083_03.jpg'];
  String imgUrl = 'http://www.3fantizi.com/article/pic/TX11083_01.jpg';
  int rand = 0;

  void onClickBtn() {
    setState(() {
      rand = Random().nextInt(5);
      // imgUrl = rootUrl + imgList[rand];
      imgUrl = 'http://www.3fantizi.com/article/pic/TX11083_0' +
          (1 + rand).toString() +
          '.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('页面标题 $rand'),
      ),
      body: new Center(
        child: new Image.network('$imgUrl'),
      ),
      floatingActionButton: new RaisedButton(
        onPressed: onClickBtn,
        child: new Text('换图'),
      ),
    );
  }
}
