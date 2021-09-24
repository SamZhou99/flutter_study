// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'packpage:video_player_control.dart';

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
    _vpc = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _initializeVideoPlayerFuture = _vpc.initialize();
    _vpc.setLooping(true);
  }

  @override
  void dispose() {
    _vpc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('视频播放器')),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _vpc.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_vpc),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_vpc.value.isPlaying) {
              _vpc.pause();
            } else {
              // If the video is paused, play it.
              _vpc.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _vpc.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
