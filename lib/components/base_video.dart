import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';


typedef PlayerCallback = void Function(FijkPlayer player);
typedef PlayerFinishCallback = void Function(FijkState state);

class BaseVideo extends StatefulWidget {
  final String path;
  final String poster;
  final bool play;
  final PlayerCallback playerCallback;
  final PlayerFinishCallback playerFinishCallback;

  const BaseVideo({Key? key, required this.path, required this.playerCallback, required this.poster, required this.play, required this.playerFinishCallback})
      : super(key: key);

  @override
  State<BaseVideo> createState() => _BaseVideoState();
}

class _BaseVideoState extends State<BaseVideo> {
  final FijkPlayer playerController = FijkPlayer();

  @override
  void initState() {
    playerController.setOption(FijkOption.hostCategory, "enable-snapshot", 1);
    playerController.setOption(FijkOption.playerCategory, "mediacodec-all-videos", 1);
    WidgetsBinding.instance.addPostFrameCallback((time) {
      startPlay();
    });
    playerController.addListener(() {
      widget.playerFinishCallback(playerController.value.state);
    });
    super.initState();
  }


  void startPlay() async {
    Future.wait([
      playerController.setOption(FijkOption.hostCategory, "request-screen-on", 1),
      playerController.setOption(FijkOption.hostCategory, "request-audio-focus", 1),
      playerController.setDataSource(widget.path, autoPlay: false, showCover: true)
    ]).then((value) {
      widget.playerCallback(playerController);
    });

  }

  void setPlay() {
    playerController.start();
  }
  void setPause() {
    playerController.pause();
  }


  @override
  void dispose() {
    playerController.removeListener(() {});
    playerController.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FijkView(
      fsFit: FijkFit.cover,
      fit: FijkFit.fitHeight,
      width: double.infinity,
      fs: false,
      color: Colors.black,
      height: double.infinity,
      player: playerController,
    );
  }
}

