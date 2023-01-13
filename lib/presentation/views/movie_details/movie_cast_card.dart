import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/data/core/api_constants.dart';

import '../../../domain/entities/cast_entity.dart';
import '../../resources/resources.dart';

class MovieCastCard extends StatelessWidget {
  final CastEntity castEntity;
  const MovieCastCard({super.key, required this.castEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.w))),
      elevation: 1,
      margin: EdgeInsets.symmetric(
        horizontal: AppMargin.m4.w,
        vertical: AppMargin.m4.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s8.w),
                topRight: Radius.circular(AppSize.s8.w),
              ),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.baseImageUrl}${castEntity.profilePath}',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w, vertical: AppPadding.p8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  castEntity.name,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColor.primary),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  castEntity.character,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
