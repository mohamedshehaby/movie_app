import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/blocs/movie_videos/movie_videos_bloc.dart';

import '../../../common/strings_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/app_button.dart';

class MovieVideos extends StatelessWidget {
  const MovieVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieVideosBloc, MovieVideosState>(
      builder: (context, state) {
        if (state is MovieVideosLoadedState) {
          if (state.videos.isNotEmpty) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
              width: ScreenUtil().screenWidth,
              child: AppButton(
                text: AppStrings.watchTrailers,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.trailersRoute, arguments: state.videos),
              ),
            );
          }
        }
        return Container();
      },
    );
  }
}
