import 'dart:async';

import 'package:day03/pages/root_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // 初始化变量
  Timer _timer = new Timer(Duration(milliseconds: 1000), () {});
  int _time = 5;

  // 初始化
  @override
  void initState() {
    super.initState();
    initTimer();
  }

  // 离开时消毁
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset('assets/images/start_page.jpg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height),
      Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        right: 10,
        child: InkWell(
          child: stepButton(),
          onTap: () {
            gotoHomePage();
          },
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 10,
        child: FlutterLogo(),
      )
    ]));
  }

  // 初始化计数器
  void initTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _time--;
      });

      if (_time <= 0) {
        gotoHomePage();
      }
    });
  }

  // 跳转到首页
  void gotoHomePage() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return RootPage();
    }), (route) => false);
  }

  // ui 跳过按钮
  Widget stepButton() {
    double _size = 50;
    double _radius = _size / 2;
    double _fontSize = 14;
    return ClipRRect(
      borderRadius: BorderRadius.circular(_radius),
      child: Container(
          width: _size,
          height: _size,
          color: Colors.black.withOpacity(0.5),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('跳过',
                style: TextStyle(color: Colors.white, fontSize: _fontSize)),
            Text("${_time}s",
                style: TextStyle(color: Colors.white, fontSize: _fontSize)),
          ])),
    );
  }
}
