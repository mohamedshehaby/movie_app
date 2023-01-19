import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/constants.dart';
import 'package:movie_app/common/languages_manager.dart';
import 'package:movie_app/di/di.dart';
import 'package:movie_app/presentation/resources/resources.dart';
import 'package:wiredash/wiredash.dart';

import '../blocs/auth/auth_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (ctx, child) {
        return EasyLocalization(
          supportedLocales: LanguagesManager.languagesLocals,
          path: LanguagesManager.translationsPath,
          saveLocale: true,
          child: Builder(
            builder: (context) {
              return Wiredash(
                projectId: Constants.wireDashProjectId,
                secret: Constants.wireDashSdkSecret,
                theme: WiredashThemeData(
                  brightness: Brightness.dark,
                  primaryColor: AppColor.primary,
                  secondaryColor: AppColor.secondary,
                ),
                options: WiredashOptionsData(locale: context.locale),
                child: MultiBlocProvider(
                  providers: [BlocProvider<AuthBloc>(create: (context) => instance())],
                  child: MaterialApp(
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    debugShowCheckedModeBanner: false,
                    theme: getAppTheme(),
                    initialRoute: Routes.splashRoute,
                    onGenerateRoute: RoutesGenerator.getRoute,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
