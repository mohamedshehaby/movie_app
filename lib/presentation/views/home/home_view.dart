import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/presentation/views/home/tabs/tabbed_widget.dart';
import 'package:movie_app/presentation/widgets/app_error_widget.dart';
import 'package:movie_app/presentation/widgets/loading_circle.dart';

import '../drawer/navigation_drawer.dart';
import 'carousel/carousel_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
              builder: (context, state) {
                if (state is MovieCarouselLoading) {
                  return LoadingCircle();
                }
                if (state is MovieCarouselLoaded) {
                  return CarouselWidget(movies: state.movies, defaultIndex: state.defaultIndex);
                } else if (state is MovieCarouselFailure) {
                  return AppErrorWidget(
                    failure: state.failure,
                    onPressed: () =>
                        context.read<MovieCarouselBloc>().add(const MovieCarouselLoadEvent()),
                  );
                }
                return Container();
              },
            ),
          ),
          const Expanded(
            flex: 5,
            child: TabbedWidget(),
          ),
        ],
      ),
    );
  }
}
