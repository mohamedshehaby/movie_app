import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/core/api_constants.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../blocs/favourite_bloc/favourite_bloc.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppMargin.m8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8.w),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            Routes.movieDetailsRoute,
            arguments: movie,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s8.w),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: '${ApiConstants.baseImageUrl}${movie.posterPath}',
                fit: BoxFit.cover,
              ),
              Positioned(
                right: AppSize.s2.w,
                child: IconButton(
                  onPressed: () {
                    context.read<FavouriteBloc>().add(DeleteFavouriteMovieEvent(movieId: movie.id));
                  },
                  icon: Icon(
                    Icons.delete,
                    size: AppSize.s32.h,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
