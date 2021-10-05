import 'package:day03/global.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage02 extends StatefulWidget {
  const HomePage02({Key? key}) : super(key: key);

  @override
  _HomePage02State createState() => _HomePage02State();
}

class _HomePage02State extends State<HomePage02> {
  Future<void> openUrl(url) async {
    // await canLaunch(url) // 检查设备是否可以打开网址
    await launch(url);
  }

  void onOpenUrlButton(url) {
    openUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Text("HomePage02", style: TextStyle(fontSize: 36)),
          ElevatedButton(
              onPressed: () {
                onOpenUrlButton('https://www.baidu.com/');
              },
              child: Text("打开 百度")),
          ElevatedButton(
              onPressed: () {
                onOpenUrlButton('https://www.163.com/');
              },
              child: Text("打开 网易")),
          ElevatedButton(
              onPressed: () {
                onOpenUrlButton(Golbal.rootUrl);
              },
              child: Text("打开 " + Golbal.rootUrl)),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  Golbal.pageNum++;
                  if (Golbal.pageNum > 10) {
                    Golbal.pageNum = 1;
                  }
                });
              },
              child: Text("页面 " + Golbal.pageNum.toString())),
        ],
      )),
    );
  }
}
