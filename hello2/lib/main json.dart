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
    map["name"] = 'name-' + getRandom(6);
    map["email"] = 'email-' + getRandom(6);
    HttpController.get("http://php2.cn/test/json", (data) {
      if (data != null) {
        final body = json.decode(data.toString());
        final name = body["randomStr"];
        final mapName = map['name'];
        final mapEmail = map['email'];
        print('json data = ' + data);
        print('name = ' + name);
        setState(() {
          dataStr = '''
map['name'] = $mapName
map['email'] = $mapEmail
name = $name
''';
          // _items = items;
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

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Container(
              child: Text(
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
