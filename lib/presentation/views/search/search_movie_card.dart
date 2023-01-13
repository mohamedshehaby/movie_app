import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/core/api_constants.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const SearchMovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.movieDetailsRoute,
          arguments: movie,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.s16.w,
          vertical: AppSize.s2.h,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSize.s8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s4.w),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.baseImageUrl}${movie.posterPath}',
                  width: AppSize.s80.w,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    movie.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
