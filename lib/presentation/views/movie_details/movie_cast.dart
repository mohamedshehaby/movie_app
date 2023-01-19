import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/widgets/loading_circle.dart';

import '../../../common/strings_manager.dart';
import '../../blocs/movie_cast/movie_cast_bloc.dart';
import '../../resources/resources.dart';
import '../../widgets/app_error_widget.dart';
import 'movie_cast_card.dart';

class MovieCast extends StatelessWidget {
  final int movieId;
  const MovieCast({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCastBloc, MovieCastState>(
      builder: (context, state) {
        if (state is MovieCastLoadingState) {
          return const LoadingCircle();
        } else if (state is MovieCastFailureState) {
          return AppErrorWidget(
            failure: state.failure,
            onPressed: () =>
                context.read<MovieCastBloc>().add(MovieCastLoadEvent(movieId: movieId)),
          );
        } else if (state is MovieCastLoadedState) {
          final cast = state.cast;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w, vertical: AppPadding.p16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.cast,
                  style: Theme.of(context).textTheme.titleLarge,
                ).tr(),
                SizedBox(
                  height: ScreenUtil().screenHeight * .3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cast.length,
                      itemBuilder: (ctx, i) {
                        return SizedBox(
                          width: ScreenUtil().screenWidth * .4,
                          child: MovieCastCard(
                            castEntity: cast[i],
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
