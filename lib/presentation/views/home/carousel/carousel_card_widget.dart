import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/resources/resources.dart';

import '../../../../data/core/api_constants.dart';

class CarouselCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const CarouselCardWidget({super.key, required this.movieId, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s24.w)),
        child: CachedNetworkImage(
          imageUrl: '${ApiConstants.baseImageUrl}$posterPath',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
