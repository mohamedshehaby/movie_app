import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../resources/values_manager.dart';
import 'favourite_movie_card_widget.dart';

class FavoriteMovieGridView extends StatelessWidget {
  final List<MovieEntity> movies;

  const FavoriteMovieGridView({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: AppSize.s16.w,
        ),
        itemBuilder: (context, index) {
          return FavoriteMovieCardWidget(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
