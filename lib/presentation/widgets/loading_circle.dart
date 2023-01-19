import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: AppSize.s200,
        height: AppSize.s200,
        child: FlareActor(
          AnimationAssets.loading,
          animation: 'load',
          snapToEnd: true,
        ),
      ),
    );
  }
}
