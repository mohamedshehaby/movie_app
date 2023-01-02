import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/languages_manager.dart';
import 'package:wiredash/wiredash.dart';

import '../../../common/strings_manager.dart';
import '../../resources/resources.dart';
import '../../widgets/app_dialog.dart';
import '../../widgets/logo.dart';
import 'navigation_expanded_list_tile.dart';
import 'navigation_list_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: AppColor.primary.withOpacity(.7), blurRadius: 4)],
      ),
      width: ScreenUtil().screenWidth * .7,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: AppPadding.p8.h,
                bottom: AppPadding.p18.h,
                left: AppPadding.p8.w,
                right: AppPadding.p8.w,
              ),
              child: Logo(
                height: AppSize.s48.h,
              ),
            ),
            NavigationListItem(
              title: AppStrings.favouriteMovies.tr(),
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: AppStrings.languages.tr(),
              children: LanguagesManager.languages.map((lang) => lang.value.tr()).toList(),
              onPressed: (index) {
                LanguagesManager.toggleLanguage(
                    languageCode: LanguagesManager.languages[index].code, context: context);
              },
            ),
            NavigationListItem(
              title: AppStrings.feedback.tr(),
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: AppStrings.about.tr(),
              onPressed: () => _showDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: AppStrings.about,
        description: AppStrings.aboutDescription,
        buttonText: AppStrings.okay,
        image: Image.asset(
          ImageAssets.tmdbLogo,
          height: AppSize.s60.h,
        ),
      ),
    );
  }
}
