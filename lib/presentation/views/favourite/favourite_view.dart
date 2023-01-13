import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/strings_manager.dart';

import '../../blocs/favourite_bloc/favourite_bloc.dart';
import 'favourite_movies_grid_view.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(AppStrings.favouriteMovies).tr(),
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteMoviesLoadedState) {
            final movies = state.movies;
            if (movies.isEmpty) {
              return Center(
                child: const Text(AppStrings.noFavoriteMovie).tr(),
              );
            } else {
              return FavoriteMovieGridView(movies: movies);
            }
          }
          return Container();
        },
      ),
      // body: ,
    );
  }
}
