import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/entities.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../common/strings_manager.dart';
import '../../di/di.dart';
import '../blocs/favourite_bloc/favourite_bloc.dart';
import '../blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../blocs/movie_carousel/movie_carousel_bloc.dart';
import '../views/favourite/favourite_view.dart';
import '../views/home/home_view.dart';
import '../views/login/login_view.dart';
import '../views/movie_details/movie_details_view.dart';
import '../views/splash/splash_view.dart';
import '../views/videos_view/videos_view.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String movieDetailsRoute = '/movie-details';
  static const String trailersRoute = '/watch-trailers';
  static const String favouritesRoute = '/favourites';
  static const String loginRoute = '/login';
  static const String splashRoute = '/splash';
}

class RoutesGenerator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute<HomeView>(
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
              BlocProvider<FavouriteBloc>(
                create: (context) => instance<FavouriteBloc>(),
              )
            ],
            child: const HomeView(),
          ),
        );
      case Routes.movieDetailsRoute:
        return customPageTransition(
          child: MovieDetailsView(
            movie: settings.arguments as MovieEntity,
          ),
          type: PageTransitionType.fade,
        );
      case Routes.trailersRoute:
        return MaterialPageRoute<VideosView>(
          builder: (_) => VideosView(
            videos: settings.arguments as List<VideoEntity>,
          ),
        );
      case Routes.favouritesRoute:
        return customPageTransition(
          child: BlocProvider<FavouriteBloc>(
            create: (context) => instance<FavouriteBloc>()..add(LoadFavouriteMoviesEvent()),
            child: const FavouritesView(),
          ),
        );
      case Routes.loginRoute:
        return customPageTransition(
          child: const LoginView(),
        );
      case Routes.splashRoute:
        return MaterialPageRoute<SplashView>(builder: (_) => const SplashView());
      default:
        return _unKnownRoute();
    }
  }

  static Route _unKnownRoute() {
    return MaterialPageRoute<Widget>(
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

PageTransition customPageTransition(
    {required Widget child, PageTransitionType type = PageTransitionType.fade}) {
  return PageTransition<Widget>(child: child, type: type);
}

// // To make a custom animation when routing
// class MyCustomRoute<T> extends MaterialPageRoute<T> {
//   MyCustomRoute({required super.builder, super.settings});
//
//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     if (settings.name == Routes.homeRoute) return child;
//     var curve = Curves.ease;
//     var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
//     return FadeTransition(opacity: animation.drive(tween), child: child);
//   }
// }
