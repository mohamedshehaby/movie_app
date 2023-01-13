import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/extensions/extensions.dart';
import 'package:movie_app/domain/entities/entities.dart';

import '../../../../data/core/api_constants.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/values_manager.dart';

class TabCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const TabCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Routes.movieDetailsRoute, arguments: movie),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s16.w),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.baseImageUrl}${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSize.s4.h),
            child: Text(
              movie.title.trimString(15),
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
