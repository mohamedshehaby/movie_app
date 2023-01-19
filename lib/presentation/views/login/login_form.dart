import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/widgets/loading_circle.dart';

import '../../../common/strings_manager.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../resources/colors_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/app_button.dart';
import 'label_field_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  late TextEditingController? _userNameController, _passwordController;
  bool enableSignIn = false;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();

    _userNameController?.addListener(() {
      setState(() {
        enableSignIn = (_userNameController?.text.isNotEmpty ?? false) &&
            (_passwordController?.text.isNotEmpty ?? false);
      });
    });
    _passwordController?.addListener(() {
      setState(() {
        enableSignIn = (_userNameController?.text.isNotEmpty ?? false) &&
            (_passwordController?.text.isNotEmpty ?? false);
      });
    });
  }

  @override
  void dispose() {
    _userNameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p32.w,
          vertical: AppPadding.p24.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: AppPadding.p8.h),
              child: Text(
                AppStrings.loginToMovieApp,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ).tr(),
            ),
            LabelFieldWidget(
              label: AppStrings.username.tr(),
              hintText: AppStrings.enterTMDbUsername.tr(),
              controller: _userNameController!,
              textFieldKey: const ValueKey('username_text_field_key'),
            ),
            LabelFieldWidget(
              label: AppStrings.password.tr(),
              hintText: AppStrings.enterPassword.tr(),
              controller: _passwordController!,
              isPasswordField: true,
              textFieldKey: const ValueKey('password_text_field_key'),
            ),
            BlocConsumer<AuthBloc, AuthState>(
              buildWhen: (previous, current) => current is AuthFailureState,
              builder: (context, state) {
                if (state is AuthFailureState) {
                  return Text(
                    state.failure.message,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.orange),
                  ).tr();
                }
                return const SizedBox.shrink();
              },
              listenWhen: (previous, current) => current != previous,
              listener: (context, state) {
                if (state is AuthLoadingState) {
                  showDialog<void>(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        backgroundColor: AppColor.primary,
                        child: Padding(
                          padding: EdgeInsets.all(AppPadding.p8.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              LoadingCircle(),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is AuthLoginState) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.homeRoute,
                    (route) => false,
                  );
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
            AppButton(
              onPressed: () => enableSignIn
                  ? context.read<AuthBloc>().add(
                        AuthLoginEvent(
                          _userNameController?.text ?? '',
                          _passwordController?.text ?? '',
                        ),
                      )
                  : null,
              text: AppStrings.signIn.tr(),
              isEnabled: enableSignIn,
            ),
            AppButton(
              onPressed: () => context.read<AuthBloc>().add(AuthGuestLoginEvent()),
              text: AppStrings.guestSignIn.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
