import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

import '../../common/strings_manager.dart';
import '../../di/di.dart';
import '../blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../blocs/movie_carousel/movie_carousel_bloc.dart';
import '../views/home/home_view.dart';

class Routes {
  static const String homeRoute = '/home';
}

class RoutesGenerator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<MovieCarouselBloc>(
                create: (_) => instance<MovieCarouselBloc>()..add(const MovieCarouselLoadEvent()),
              ),
              BlocProvider<MovieBackdropBloc>(create: (_) => instance<MovieBackdropBloc>()),
              BlocProvider<MovieTabbedBloc>(
                create: (context) =>
                    instance<MovieTabbedBloc>()..add(const MovieTabbedChangedEvent()),
              ),
            ],
            child: const HomeView(),
          ),
        );
      default:
        return _unKnownRoute();
    }
  }

  static Route _unKnownRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
          body: Center(
            child: const Text(AppStrings.noRouteFound).tr(),
          ),
        );
      },
    );
  }
}
