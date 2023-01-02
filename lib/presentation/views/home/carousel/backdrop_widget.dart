import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import '../../../resources/values_manager.dart';

class BackdropWidget extends StatelessWidget {
  const BackdropWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
      builder: (context, state) {
        if (state is MovieBackdropChangedState) {
          return FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: .75,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppSize.s20.w)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: '${ApiConstants.baseImageUrl}${state.movie.backdropPath}',
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.transparent,
                      // height: 1,
                      // width: ScreenUtil().screenWidth,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
