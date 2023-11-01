import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.file, required this.play});
  final File file;
  final bool play;
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  late ChewieController _chewieController;


  @override
  void initState() {

    _videoPlayerController = VideoPlayerController.file(widget.file);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((_) {

     _chewieController = ChewieController(videoPlayerController: _videoPlayerController,
     aspectRatio: _videoPlayerController.value.aspectRatio);
      
      // _videoPlayerController.play();
      
      setState(() {
        
      });
    } );
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(aspectRatio: _videoPlayerController.value.aspectRatio,child: Chewie(  controller: _chewieController,),);
        } else {
          return Center(
            child: SpinKitCircle(color: Colors.blue,size:50,),
          );
        }

      });
  }
}