import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/presentation/widgets/logo.dart';

import '../resources/resources.dart';
import '../views/search/custom_search_delegate.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().statusBarHeight + AppPadding.p4.h,
        right: AppPadding.p16.w,
        left: AppPadding.p16.w,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: SvgPicture.asset(
              ImageAssets.menuIcon,
              height: AppSize.s24.h,
            ),
          ),
          Expanded(
            child: Logo(height: AppSize.s24.h),
          ),
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: AppSize.s24.h,
            ),
          ),
        ],
      ),
    );
  }
}
