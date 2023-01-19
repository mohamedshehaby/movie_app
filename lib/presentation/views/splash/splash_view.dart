import 'dart:async';

import 'package:flutter/material.dart';

import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Logo(
          height: AppSize.s100,
        ),
      ),
    );
  }
}
