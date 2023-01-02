import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/data/network/failure.dart';
import 'package:wiredash/wiredash.dart';

import '../../common/strings_manager.dart';
import '../resources/values_manager.dart';
import 'app_button.dart';

class AppErrorWidget extends StatelessWidget {
  final Failure failure;
  final Function() onPressed;

  const AppErrorWidget({
    super.key,
    required this.failure,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p32.w, vertical: AppPadding.p32.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            failure.failureType == FailureType.api ? AppStrings.defaultError : failure.message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppButton(
                onPressed: onPressed,
                text: AppStrings.retry,
              ),
              AppButton(
                onPressed: () => Wiredash.of(context).show(),
                text: AppStrings.feedback,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
