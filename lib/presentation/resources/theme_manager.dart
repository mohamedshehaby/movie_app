import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'resources.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

ThemeData getAppTheme() {
  return ThemeData(
    useMaterial3: true,

    // Main Colors
    primaryColor: AppColor.primary,
    primaryColorLight: AppColor.lightPrimary,
    primaryColorDark: AppColor.darkPrimary,
    disabledColor: AppColor.grey1,
    errorColor: Colors.red,
    splashColor: AppColor.lightPrimary,

    primarySwatch: createMaterialColor(AppColor.primary),

    // ExpansionTile Theme
    expansionTileTheme: ExpansionTileThemeData(
      collapsedIconColor: AppColor.secondary,
      iconColor: AppColor.secondary,
      childrenPadding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w),
    ),

    // ProgressIndicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColor.secondary),

    // CardView Theme
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: AppSize.s4.h,
    ),

    // App Bar Theme
    appBarTheme: AppBarTheme(
      toolbarHeight: AppSize.s40.h,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColor.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: true,
      backgroundColor: AppColor.primary,
      shadowColor: AppColor.lightPrimary,
      elevation: AppSize.s4.h,
      titleTextStyle: getSemiBoldTextStyle(fontSize: FontSize.s16, color: Colors.white),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, AppSize.s40.h),
        textStyle: getRegularTextStyle(color: Colors.white, fontSize: FontSize.s18),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12.w)),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColor.primary,
        textStyle: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s12),
      ),
    ),

    //Text Theme
    textTheme: TextTheme(
      displayLarge: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s58),
      displayMedium: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s46),
      displaySmall: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s36),
      headlineLarge: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s32),
      headlineMedium: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s28),
      headlineSmall: getRegularTextStyle(color: AppColor.primary, fontSize: FontSize.s24),

      // @used
      // [movie name in carousel ]
      titleLarge: getRegularTextStyle(color: Colors.white, fontSize: FontSize.s22),

      // [Error Widget]
      titleMedium: getMediumTextStyle(color: Colors.white, fontSize: FontSize.s16),

      // @used
      // [movie name in tabs ]
      // [unselected movie type in tabs]
      titleSmall: getMediumTextStyle(color: Colors.white, fontSize: FontSize.s14),

      // @used
      // [selected movie type in tabs]
      labelLarge: getMediumTextStyle(color: AppColor.secondary, fontSize: FontSize.s14),

      // @used
      // [Drawer list items]
      labelMedium: getMediumTextStyle(color: Colors.white, fontSize: FontSize.s12),

      labelSmall: getMediumTextStyle(color: AppColor.grey, fontSize: FontSize.s11),
      bodyLarge: getMediumTextStyle(color: AppColor.lightGrey, fontSize: FontSize.s16),
      bodyMedium: getRegularTextStyle(color: AppColor.lightGrey, fontSize: FontSize.s14),
      bodySmall: getRegularTextStyle(color: AppColor.grey2, fontSize: FontSize.s12),
    ),

    // Form Field Theme
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle: getRegularTextStyle(color: AppColor.grey, fontSize: FontSize.s14),
      // label style
      labelStyle: getMediumTextStyle(color: AppColor.grey, fontSize: FontSize.s14),
      // error style
      errorStyle: getRegularTextStyle(color: Colors.red),
      // enabled border
      enabledBorder: _getOutlineInputBorder(color: AppColor.darkPrimary),
      // focused border
      focusedBorder: _getOutlineInputBorder(color: AppColor.primary),
      // error border
      errorBorder: _getOutlineInputBorder(color: Colors.red),
      // focused error border
      focusedErrorBorder: _getOutlineInputBorder(color: AppColor.primary),
    ),
  );
}

OutlineInputBorder _getOutlineInputBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: AppSize.s1.w),
    borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.w)),
  );
}
