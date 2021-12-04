import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final VideoPlayerController vpController;

  const Video({required this.vpController});

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late ChewieController cController;

  @override
  void initState() {
    super.initState();

    cController = ChewieController(
      videoPlayerController: widget.vpController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: false,
      errorBuilder: (context, errorMessage) {
        return Center(child: progressBar());
      },
    );
  }

  Widget progressBar() {
    return CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: AspectRatio(
        child: Chewie(
          controller: cController,
        ),
        aspectRatio: 16 / 9,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    widget.vpController.dispose();
    cController.dispose();
    cController.pause();
  }
}
