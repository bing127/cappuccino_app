import 'dart:async';

import 'package:cappuccino/components/app_image/app_image.dart';
import 'package:cappuccino/components/app_image/app_loading_indicator.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BaseSimpleVideo extends StatefulWidget {
  final String path;
  final String poster;

  const BaseSimpleVideo({super.key, required this.path, required this.poster});

  @override
  State<BaseSimpleVideo> createState() => _BaseSimpleVideoState();
}

class _BaseSimpleVideoState extends State<BaseSimpleVideo> {
  late VideoPlayerController _controller;
  late bool isPlay = false;
  late Future<void> _initializeVideoPlayerFuture;
  late Timer _timer;
  int _remainingTime = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.path));
    _initializeVideoPlayerFuture = _controller.initialize();
    if (_controller.value.isInitialized) {
      _controller.setLooping(true);
      setState(() {
        _remainingTime = getRemainingTime();
      });
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_controller.value.isPlaying) {
        setState(() {
          _remainingTime = getRemainingTime();
        });
      }
    });

    _controller.addListener(_playStatus);
  }

  void _playStatus() {
      setState(() {
        if(_controller.value.isPlaying) {
          isPlay = true;
        } else {
          isPlay = false;
        }
      });
  }

  int getRemainingTime() {
    return (_controller.value.duration.inSeconds -
            _controller.value.position.inSeconds)
        .clamp(0, _controller.value.duration.inSeconds);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: Key(Utils.createMd5(widget.path)),
        onVisibilityChanged: (visibilityInfo) {
          double visiblePercentage = visibilityInfo.visibleFraction * 100;
          if(mounted) {
            if (visiblePercentage > 50) {
              _controller.play().then((_) {
                setState(() {
                  isPlay = true;
                });
              });
            } else {
              _controller.pause().then((_) {
                setState(() {
                  isPlay = false;
                });
              });
            }
          }
        },
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.black,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Text(
                      formatDuration(Duration(seconds: _remainingTime)),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      child: isPlay ? const SizedBox.shrink() : Container(
                        color: Colors.black.withOpacity(0.01),
                        child: Icon(RemixIcon.play_circle, color: Colors.black.withOpacity(0.8), size: 30,),
                      ),
                      onTap: () {
                        if(isPlay) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      },
                    ),
                  )
                ],
              );
            } else {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: AppImage(
                      image: NetworkImage(widget.poster),
                    ),
                  ),
                  const Positioned(
                    child: AppLoadingIndicator(),
                  )
                ],
              );
            }
          },
        ));
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.removeListener(_playStatus);
    _controller.dispose();
    super.dispose();
  }
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return '$twoDigitMinutes:$twoDigitSeconds';
}
