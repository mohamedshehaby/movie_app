import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/views/home/tabs/tab_card_widget.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../resources/values_manager.dart';

class ListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const ListViewBuilder({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.s16.h),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: AppMargin.m6.w),
            width: ScreenUtil().screenWidth * .35,
            child: TabCardWidget(
              movie: movies[index],
            ),
          );
        },
      ),
    );
  }
}
