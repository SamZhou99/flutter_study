import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hello2/common/HttpController.dart';

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPage();
  }
}

class MainPage extends State<Main> {
  String dataStr = 'Loading...';
  int itemLength = 0;
  int clickNum = 0;

  @override
  void initState() {
    super.initState();
    getData('http://127.0.0.1:3000/list/1.html/json');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Text $index'));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 1,
                    color: Color(0x33333333),
                  );
                },
                itemCount: itemLength)));
  }

  void getData(url) async {
    Map<String, String> map = new Map();
    map["name"] = 'name-' + getRandom(6);
    map["email"] = 'email-' + getRandom(6);
    print(url);
    HttpController.get(url, (data) {
      if (data != null) {
        final body = json.decode(data.toString());
        final len = body['list'].length;
        final title = body['list'][0]['title'];
        itemLength = len;
        setState(() {
          dataStr = '''
title = $title
length = $len
clickNumber = $clickNum
''';
        });
      }
    }, params: map);
  }

  String getRandom(maxLen) {
    String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
    int strlenght = maxLen;

    /// 生成的字符串固定长度
    String left = '';
    for (var i = 0; i < strlenght; i++) {
      //    right = right + (min + (Random().nextInt(max - min))).toString();
      left = left + alphabet[Random().nextInt(alphabet.length)];
    }
    return left;
  }
}

void main() {
  runApp(new Main());
}
