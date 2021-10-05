import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:day03/global.dart';
import 'package:day03/pages/video_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage01 extends StatefulWidget {
  const HomePage01({Key? key}) : super(key: key);

  @override
  _HomePage01State createState() => _HomePage01State();
}

class _HomePage01State extends State<HomePage01> {
  var _item = [];

  @override
  void initState() {
    super.initState();
    getHttp(Golbal.listUrl.replaceAll('{page}', Golbal.pageNum.toString()));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: getItemList()),
    );
  }

  // 列表数据
  List<String> getDataList() {
    List<String> list = [];
    // for (int i = 0; i < 10; i++) {
    //   list.add('item ' + i.toString());
    // }
    return list;
  }

  // item 内容
  Widget getItemContainer(itemData) {
    return Container(
        child: Column(children: [
      GestureDetector(
          child: Image.network(
            itemData['img'],
            fit: BoxFit.fitHeight,
          ),
          onTap: () {
            Golbal.itemData = itemData;
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => VideoPage()));
          }),
      SizedBox(
        height: 3,
      ),
      Text(itemData['title'], overflow: TextOverflow.ellipsis),
    ]));
  }

  // 数据转成 widget 列表
  List<Widget> getWidgetList() {
    return _item.map((item) => getItemContainer(item)).toList();
  }

  // item 列表
  Widget getItemList() {
    return GridView.count(
      crossAxisSpacing: 10.0, //水平子Widget之间间距
      mainAxisSpacing: 10.0, //垂直子Widget之间间距
      padding: EdgeInsets.all(10.0), //GridView内边距
      crossAxisCount: 2, //一行的Widget数量
      childAspectRatio: 16 / 11, //子Widget宽高比例
      children: getWidgetList(), //子Widget列表
    );
  }

  // 随机颜色
  Color getRandomColor() {
    return Color.fromARGB(
      255,
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
      Random.secure().nextInt(200),
    );
  }

  // http请求
  void getHttp(String url) async {
    try {
      var response = await Dio().get(url);
      var itmes = [];
      final body = json.decode(response.toString());
      final list = body['list'];
      list.forEach((item) {
        itmes.add(item);
      });
      setState(() {
        _item = itmes;
      });
    } catch (e) {
      print(e);
    }
  }

  // 对话框
  void showAlertDialog(BuildContext context, model) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(model['title'] + ', ' + model['video']),
            title: Center(
                child: Text(
              '标题',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.done)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close)),
            ],
          );
        });
  }
}
