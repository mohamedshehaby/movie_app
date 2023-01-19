import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/values_manager.dart';
import '../../widgets/logo.dart';
import 'login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: AppSize.s32.h),
              child: Logo(
                key: const ValueKey('logo_key'),
                height: AppSize.s75.h,
              ),
            ),
            const Expanded(
              child: LoginForm(
                key: ValueKey('login_form_key'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
