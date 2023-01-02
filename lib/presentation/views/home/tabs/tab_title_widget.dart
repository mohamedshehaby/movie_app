import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/resources.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isSelected;

  const TabTitleWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.secondary : Colors.transparent,
              width: AppSize.s1.h,
            ),
          ),
        ),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context).textTheme.labelLarge
              : Theme.of(context).textTheme.titleSmall,
        ).tr(),
      ),
    );
  }
}
