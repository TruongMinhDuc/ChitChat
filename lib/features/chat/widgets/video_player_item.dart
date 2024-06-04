import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({
    super.key,
    required this.videoUrl,
  });

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late CachedVideoPlayerController videoPlayerController;
  bool isPlay = false;
  bool _visible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = CachedVideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.setVolume(1);
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: videoPlayerController.value.aspectRatio,
      child: Stack(
        children: [
          CachedVideoPlayer(videoPlayerController),
          Opacity(
            opacity: _visible ? 1 : 0,
            child: Center(
              child: IconButton(
                onPressed: () {
                  if(isPlay) {
                    videoPlayerController.pause();
                  }
                  else {
                    videoPlayerController.play();
                    videoPlayerController.setLooping(!isPlay);
                  }
                  setState(() {
                    isPlay = !isPlay;
                    _visible = !_visible;
                  });
                },
                icon: const Icon(
                    Icons.play_arrow,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
