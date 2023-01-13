import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entities/entities.dart';
import 'package:movie_app/presentation/resources/resources.dart';

import '../../../../data/core/api_constants.dart';

class CarouselCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const CarouselCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Routes.movieDetailsRoute, arguments: movie),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s24.w)),
        child: CachedNetworkImage(
          imageUrl: '${ApiConstants.baseImageUrl}${movie.posterPath}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
