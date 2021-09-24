import 'package:day03/global.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _vpc;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _vpc = VideoPlayerController.network(Golbal.itemData['video']);
    _initializeVideoPlayerFuture = _vpc.initialize();
    _vpc.setLooping(true);
    setState(() {
      if (_vpc.value.isPlaying) {
        _vpc.pause();
      } else {
        _vpc.play();
      }
    });
  }

  @override
  void dispose() {
    _vpc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Golbal.itemData['title'])),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _vpc.value.aspectRatio,
              child: VideoPlayer(_vpc),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_vpc.value.isPlaying) {
              _vpc.pause();
            } else {
              _vpc.play();
            }
          });
        },
        child: Icon(
          _vpc.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
