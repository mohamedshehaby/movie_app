import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/values_manager.dart';
import 'carousel_card_widget.dart';

class AnimatedCarouselCardWidget extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimatedCarouselCardWidget({
    super.key,
    required this.index,
    required this.movieId,
    required this.posterPath,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = (pageController.page ?? 0) - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);

          return AnimatedOpacity(
            opacity: (index == pageController.page) ? 1 : .6,
            duration: const Duration(milliseconds: 50),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: Curves.easeIn.transform(value) * ScreenUtil().screenHeight * 0.4,
                width: AppSize.s200.w,
                child: child,
              ),
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                  ScreenUtil().screenHeight *
                  0.4,
              width: AppSize.s200.w,
              child: child,
            ),
          );
        }
      },
      child: CarouselCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}
