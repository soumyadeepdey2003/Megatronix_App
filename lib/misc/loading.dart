// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'navigation.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late VideoPlayerController _controller;
  bool _isDisposed = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/loading1.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown before transitioning to the main screen.
        if (!_isDisposed) {
          setState(() {});
          _controller.play();
          if (!_isDisposed) {
            Future.delayed(
                Duration(seconds: _controller.value.duration.inSeconds), () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => NavigationBarApp(),
                ),
              );
            });
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? SizedBox.expand(
                child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ))
            : CircularProgressIndicator(), // You can use a loading indicator here.
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
    _controller.dispose();
  }
}
