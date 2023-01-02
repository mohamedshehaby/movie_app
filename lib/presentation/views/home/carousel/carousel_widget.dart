import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/entities.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/separator.dart';
import 'backdrop_widget.dart';
import 'carousel_page_view.dart';
import 'data_widget.dart';

class CarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;
  const CarouselWidget({super.key, required this.movies, required this.defaultIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const BackdropWidget(),
        Column(
          children: [
            const CustomAppBar(),
            Expanded(child: CarouselPageView(movies: movies, initialPage: defaultIndex)),
            const DataWidget(),
            const Separator(),
            SizedBox(
              height: AppSize.s10.h,
            )
          ],
        ),
      ],
    );
  }
}
