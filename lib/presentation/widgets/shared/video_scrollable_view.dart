import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';

import '../../../domain/entities/video_post.dart';
import '../video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // Se usa para que haya una fisica del scroll, tal como se ve en otros dispositivos como si hubiese un overflow
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {

        final VideoPost videoPost = videos[index];

        return Stack(children: [
          // video Player + gradients
          // FullScreenPlayer()
          SizedBox.expand(
            child: FullScreenPlayer(
              caption: videoPost.caption,
              videoUrl: videoPost.videoUrl,
              )
          ),

          // Botones
          Positioned(
            bottom: 40,
            right: 20,
            child: VideoButtons(video: videoPost)
            ),
        ]);
      },
    );
  }
}
