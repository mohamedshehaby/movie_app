import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/strings_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import 'app_button.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget? image;

  const AppDialog({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: AppSize.s32,
      insetPadding: EdgeInsets.all(AppPadding.p32.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8.w),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p8.h, horizontal: AppPadding.p16.w),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.primary,
              blurRadius: AppSize.s16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ).tr(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppPadding.p12.h),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ).tr(),
            ),
            if (image != null) image!,
            AppButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: AppStrings.okay,
            ),
          ],
        ),
      ),
    );
  }
}
