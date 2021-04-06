import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hello2/common/HttpController.dart';

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPage();
  }
}

class MainPage extends State<Main> {
  String tempStr = 'Loading...';
  var _item = [];

  @override
  void initState() {
    super.initState();
    getData('http://www.lajiao999.com/list/1.html/json');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ListView.builder(
            itemCount: _item.length,
            itemBuilder: itemView,
            shrinkWrap: true,
          ),
        ));
  }

  void showAlertDialog(BuildContext context, model) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(model.title),
            title: Center(
                child: Text(
              '标题',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('确定')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('取消')),
            ],
          );
        });
  }

  Widget itemView(BuildContext context, int index) {
    Model model = this._item[index];

    // //设置分割线
    // if (index.isOdd) {
    //   return new Divider(height: 2.0);
    // }

    return Container(
      color: Color(0xFFee22aa),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Image.network(
                model.img,
                // height: 160,
                width: 120,
              ),
              Expanded(
                child: Text(
                  '\t${model.title}',
                  style: TextStyle(fontSize: 14.0, color: Color(0xFFffffff)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          onTap: () {
            print(model.title);
            print(model.video);
            showAlertDialog(context, model);
          },
        ),
      ),
    );
  }

  void getData(url) async {
    Map<String, String> map = new Map();
    map['temp'] = 'temp';
    print(url);
    HttpController.get(url, (data) {
      if (data != null) {
        final body = json.decode(data.toString());
        final list = body['list'];

        list.forEach((item) {
          _item.add(Model(item["id"], item["title"], item["img"],
              item["local_img"], item["type1"], item["video"]));
        });
        print(list.length);
        print(_item.length);
        setState(() {
          tempStr = '''
HI
''';
        });
      }
    }, params: map);
  }
}

class Model {
  // String _id;
  int id;
  String title;
  String type1;
  String type2;
  String img;
  String local_img;
  String link;
  String source_site;
  String video;
  int status;
  int is_html;
  String date;
  String created;

  Model(this.id, this.title, this.img, this.local_img, this.type1, this.video);
}

void main() {
  runApp(new Main());
}
