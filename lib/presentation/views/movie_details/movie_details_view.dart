import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/entities.dart';
import 'package:movie_app/presentation/blocs/favourite_bloc/favourite_bloc.dart';

import '../../../di/di.dart';
import '../../blocs/movie_cast/movie_cast_bloc.dart';
import '../../blocs/movie_videos/movie_videos_bloc.dart';
import 'big_poster.dart';
import 'movie_cast.dart';
import 'movie_overview.dart';
import 'movie_videos.dart';

class MovieDetailsView extends StatelessWidget {
  final MovieEntity movie;

  const MovieDetailsView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                instance<MovieCastBloc>()..add(MovieCastLoadEvent(movieId: movie.id)),
          ),
          BlocProvider(
            create: (context) =>
                instance<MovieVideosBloc>()..add(MovieVideosLoadEvent(movieId: movie.id)),
          ),
          BlocProvider<FavouriteBloc>(
            create: (context) =>
                instance<FavouriteBloc>()..add(CheckIfFavouriteMovieEvent(movieId: movie.id)),
          )
        ],
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigPoster(movie: movie),
                MovieOverview(overview: movie.overview),
                MovieCast(movieId: movie.id),
                const MovieVideos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
