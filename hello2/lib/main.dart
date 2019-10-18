import 'package:flutter/material.dart';

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Container(
              child: Text(
                'I Love China !!! 我是一段 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 很长 的文字',
                style: TextStyle(fontFamily: 'RobotoMono', color: Colors.black87, fontSize: 16,fontStyle: FontStyle.italic),
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
  runApp(new TabbedAppBarSample());
}
