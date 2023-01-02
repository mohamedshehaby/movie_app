import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/assets_manager.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.logo,
      color: Colors.white,
      height: height.h,
    );
  }
}
