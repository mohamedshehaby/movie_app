import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/extensions/extensions.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/domain/entities/entities.dart';

import '../../resources/colors_manager.dart';
import 'movie_detail_appbar.dart';

class BigPoster extends StatelessWidget {
  final MovieEntity movie;
  const BigPoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: ScreenUtil().screenHeight * .8,
          width: ScreenUtil().screenWidth,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColor.primary.withOpacity(.3), AppColor.primary],
            ),
          ),
          child: CachedNetworkImage(
              fit: BoxFit.cover, imageUrl: '${ApiConstants.baseImageUrl}${movie.posterPath}'),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: ListTile(
            title: Text(movie.title),
            subtitle: Text(movie.releaseDate),
            trailing: Text(
              movie.voteAverage.convertToPercentageString(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
        MovieDetailsAppBar(movie: movie)
      ],
    );
  }
}
