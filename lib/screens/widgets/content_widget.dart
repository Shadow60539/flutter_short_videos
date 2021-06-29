import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_short_videos/screens/options_screen.dart';
import 'package:flutter_short_videos/screens/widgets/like_icon.dart';
import 'package:video_player/video_player.dart';

class ContentWidget extends StatefulWidget {
  final String src;

  const ContentWidget({Key key, this.src}) : super(key: key);

  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  bool _liked = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.network(widget.src, formatHint: VideoFormat.hls);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
      aspectRatio: 9 / 16,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (_chewieController != null &&
            _chewieController.videoPlayerController.value.isInitialized)
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                _liked = !_liked;
              });
            },
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Chewie(
                controller: _chewieController,
              ),
            ),
          )
        else
          const SizedBox.shrink(),
        if (_liked)
          Center(
            child: LikeIcon(),
          ),
        OptionsScreen()
      ],
    );
  }
}
//Thanks for watching source code will be available on description
//Like share and Subscribe
