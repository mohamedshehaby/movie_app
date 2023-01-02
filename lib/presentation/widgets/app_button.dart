import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isEnabled;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isEnabled ? [AppColor.secondary, AppColor.ternary] : [Colors.grey, Colors.grey],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s20.w),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      margin: EdgeInsets.symmetric(vertical: AppMargin.m12.h),
      height: AppSize.s32.h,
      child: TextButton(
        key: const ValueKey('main_button'),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ).tr(),
      ),
    );
  }
}
