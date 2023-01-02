import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s2.h,
      width: AppSize.s80.w,
      padding: EdgeInsets.only(
        top: AppSize.s4.h,
        bottom: AppSize.s6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s1.h)),
        gradient: const LinearGradient(
          colors: [
            AppColor.ternary,
            AppColor.secondary,
          ],
        ),
      ),
    );
  }
}
