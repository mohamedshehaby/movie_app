import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/values_manager.dart';

class MovieOverview extends StatelessWidget {
  final String overview;
  const MovieOverview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      child: Text(
        overview,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
