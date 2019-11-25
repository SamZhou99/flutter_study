import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hello2/common/HttpController.dart';

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TestPage();
  }
}

class TestPage extends State<Main> {
  String dataStr = '默认的数据';
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    Map<String, String> map = new Map();
    map["name"] = getRandom();
    map["email"] = getRandom();
    HttpController.get("http://php3.cn/index.php", (data) {
      if (data != null) {
        final body = json.decode(data.toString());
        final name = body["name"];
        print('json data = ' + data);
        print('name = ' + name);
        //   var items = [];
        //   feeds.forEach((item) {
        //     items.add(Model(item["_id"], item["title"], item["pic"], item["year"],
        //         item["month"], item["day"], item["des"], item["lunar"]));
        //   });
        setState(() {
          dataStr = data.toString();
          // _items = items;
        });
      }
    }, params: map);
  }

  String getRandom() {
    String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
    int strlenght = 30;

    /// 生成的字符串固定长度
    String left = '';
    for (var i = 0; i < strlenght; i++) {
      //    right = right + (min + (Random().nextInt(max - min))).toString();
      left = left + alphabet[Random().nextInt(alphabet.length)];
    }
    return left;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Container(
              child: Text(
                'I Love China !!! I Love Self !!! 我是一段 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 的文字 123' +
                    dataStr,
                style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Colors.black87,
                    fontSize: 16,
                    fontStyle: FontStyle.italic),
              ),
              // alignment: Alignment.center,
              alignment: Alignment.topLeft,
              width: 300.0,
              height: 300.0,
              color: Colors.amber,
              padding: const EdgeInsets.all(10.0),
            ),
          ),
        ));
  }
}

void main() {
  runApp(new Main());
}
