import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('标题文字'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

int getRandom(minNum, maxNum) {
  return minNum + new Random().nextInt(maxNum - minNum);
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  var r = getRandom(100, 999);
  void onClickButton() {
    setState(() {
      r = getRandom(100, 999);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "( $r )",
          style: TextStyle(fontSize: 36),
        ),
        ElevatedButton(
            onPressed: () {
              onClickButton();
            },
            child: Text("ElevatedButton")),
        TextButton(
            onPressed: () {
              onClickButton();
            },
            child: Text("TextButton")),
        TextButton.icon(
            onPressed: () {
              onClickButton();
            },
            icon: Icon(Icons.access_time),
            label: Text("TextButton.icon")),
      ],
    );
  }
}
