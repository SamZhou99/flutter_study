import 'package:day03/global.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _vpc;
  late Future<void> _initializeVideoPlayerFuture;
  String _duraStr = '0.00';
  int seekNum = 20;

  // 进度百分比
  void onProgress() {
    if (!_vpc.value.hasError) {
      setState(() {
        //进度条的播放进度，用当前播放时间除视频总长度得到
        _duraStr = (_vpc.value.position.inSeconds /
                _vpc.value.duration.inSeconds *
                100)
            .toStringAsFixed(2);
      });
    }
  }

  // 播放与暂停
  void onPlayPause() {
    setState(() {
      if (_vpc.value.isPlaying) {
        _vpc.pause();
      } else {
        _vpc.play();
      }
    });
  }

  // 跳转到
  void onSeekTo(String stateStr) {
    setState(() {
      int stepNum = _vpc.value.duration.inSeconds ~/ seekNum;
      if (_vpc.value.isPlaying) {
        if (stateStr == "+") {
          _vpc.seekTo(
              Duration(seconds: _vpc.value.position.inSeconds + stepNum));
        } else {
          _vpc.seekTo(
              Duration(seconds: _vpc.value.position.inSeconds - stepNum));
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _vpc = VideoPlayerController.network(Golbal.itemData['video']);
    _initializeVideoPlayerFuture = _vpc.initialize();
    _vpc.setLooping(true);
    _vpc.addListener(onProgress);
    Wakelock.enable();
    onPlayPause();
  }

  @override
  void dispose() {
    Wakelock.disable();
    _vpc.removeListener(onProgress);
    _vpc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('============================================================');
    // print(_vpc.value);
    // print('============================================================');
    return Scaffold(
      appBar: AppBar(title: Text(Golbal.itemData['title'])),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                SizedBox(
                  // height: 232,
                  height: 400,
                  child: Container(
                      color: Colors.black,
                      child: Center(
                          child: AspectRatio(
                        aspectRatio: _vpc.value.aspectRatio,
                        child: VideoPlayer(_vpc),
                      ))),
                ),
                Text('点赞'),
                Text('收藏'),
                Text('评论'),
                Text('聊天'),
                Text('$_duraStr%'),
                ElevatedButton(
                    onPressed: () {
                      onSeekTo("+");
                    },
                    child: Text('快进')),
                ElevatedButton(
                    onPressed: () {
                      onSeekTo("-");
                    },
                    child: Text('后退')),
                ElevatedButton(onPressed: onPlayPause, child: Text('播放/暂停')),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.greenAccent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink)),
            );
          }
        },
      ),
    );
  }
}
