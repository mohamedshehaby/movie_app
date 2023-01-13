import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../common/strings_manager.dart';
import '../../../domain/entities/video_entity.dart';
import '../../resources/values_manager.dart';

class VideosView extends StatefulWidget {
  final List<VideoEntity> videos;
  const VideosView({super.key, required this.videos});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  late List<VideoEntity> videos = widget.videos;

  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videos.first.key,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      controlsVisibleAtStart: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(AppStrings.watchTrailers).tr(),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          progressColors:
              const ProgressBarColors(playedColor: Colors.red, handleColor: Colors.redAccent),
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: videos.length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: AppPadding.p16.h),
                      height: AppSize.s150.h,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
                            child: GestureDetector(
                              child: CachedNetworkImage(
                                imageUrl: YoutubePlayer.getThumbnail(
                                    videoId: videos[i].key, quality: ThumbnailQuality.max),
                              ),
                              onTap: () {
                                _controller.load(videos[i].key);
                                _controller.play();
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
                              child: Text(
                                videos[i].name,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
