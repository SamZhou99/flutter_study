import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "页面路由",
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Page011(),
    );
  }
}

class Global {
  static String temp_player_url = 'https://2.ddyunbo.com/20200608/2wuSXuZ6/600kb/hls/index.m3u8';
}

class Page01 extends StatelessWidget {
  const Page01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("第一页"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page02()));
              },
              child: Text("显示第二页")),
          // Image.asset("images/img01.jpeg")
          Image.network("https://p3-sign.bdxiguaimg.com/xigua-lvideo-pic/757c2831dc04e803dce3384f4b438104~tpl-1_noop.jpeg?x-expires=1632639520&x-signature=%2B2GHNjfNdCxPrq1R0Hy%2B3PMcCH0%3D")
        ],
      ),
    );
  }
}

class Page011 extends StatelessWidget {
  const Page011({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("第一页"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page02()));
              },
              child: Text("显示第二页")),
          // Image.asset("images/img01.jpeg")
          Image.network("https://p3-sign.bdxiguaimg.com/xigua-lvideo-pic/757c2831dc04e803dce3384f4b438104~tpl-1_noop.jpeg?x-expires=1632639520&x-signature=%2B2GHNjfNdCxPrq1R0Hy%2B3PMcCH0%3D")
        ],
      ),
    );
  }
}

class Page02 extends StatelessWidget {
  const Page02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.redAccent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("第二页"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page03()));
              },
              child: Text("显示第三页")),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("返回")),
          // Image.asset("images/img02.jpeg")
          Image.network("https://p6-sign.bdxiguaimg.com/xigua-lvideo-pic/e9c7e4d5b6a0fc8cbaf4659d734f31bf~tpl-1_noop.jpeg?x-expires=1632639520&x-signature=RhD1Ni8rRvJiSXjN2%2BF9rvAKHEc%3D")
        ],
      ),
    );
  }
}

class Page03 extends StatelessWidget {
  const Page03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("第三页"),
          ElevatedButton(
              onPressed: () {
                Global.temp_player_url = 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4';
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page04()));
              },
              child: Text("显示第四页_1")),
          ElevatedButton(
              onPressed: () {
                Global.temp_player_url = 'https://2.ddyunbo.com/20200601/illZIjT8/600kb/hls/index.m3u8';
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page04()));
              },
              child: Text("显示第四页_2")),
          ElevatedButton(
              onPressed: () {
                Global.temp_player_url = 'https://2.ddyunbo.com/20200608/2wuSXuZ6/600kb/hls/index.m3u8';
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page04()));
              },
              child: Text("显示第四页_3")),
          ElevatedButton(
              onPressed: () {
                Global.temp_player_url = 'https://vip4.ddyunbo.com/20210626/5T0FbL8s/index.m3u8';
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page04()));
              },
              child: Text("显示第四页_4")),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("返回")),
          // Image.asset("images/img03.jpeg")
          Image.network("https://p6-sign.bdxiguaimg.com/xigua-lvideo-pic/062202b162247ac3eb7ddce2a12a6a53~tpl-1_noop.jpeg?x-expires=1632639520&x-signature=bQm2arC5z%2Bgaquz8nK4oCwZgqiA%3D"),
        ],
      ),
    );
  }
}

class Page04 extends StatefulWidget {
  const Page04({Key? key}) : super(key: key);
  @override
  _Page04State createState() => _Page04State();
}

class _Page04State extends State<Page04> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(Global.temp_player_url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text("第四页"),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("返回")),
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            )),
      ],
    ));
  }
}
