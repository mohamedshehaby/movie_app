import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/entities.dart';
import 'package:movie_app/presentation/blocs/favourite_bloc/favourite_bloc.dart';

class MovieDetailsAppBar extends StatefulWidget {
  final MovieEntity movie;
  const MovieDetailsAppBar({super.key, required this.movie});

  @override
  State<MovieDetailsAppBar> createState() => _MovieDetailsAppBarState();
}

class _MovieDetailsAppBarState extends State<MovieDetailsAppBar> {
  @override
  void initState() {
    context.read<FavouriteBloc>().add(CheckIfFavouriteMovieEvent(movieId: widget.movie.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackButton(
          color: Colors.white,
        ),
        BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            if (state is IsFavouriteMovieState) {
              return IconButton(
                onPressed: () => context.read<FavouriteBloc>().add(
                      ToggleFavouriteMovieEvent(
                        movieEntity: widget.movie,
                        isFavourite: state.isFavourite,
                      ),
                    ),
                icon: Icon(
                  (state.isFavourite) ? Icons.favorite : Icons.favorite_border,
                  color: (state.isFavourite) ? Colors.red : Colors.white,
                ),
              );
            }
            return IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border));
          },
        )
      ],
    );
  }
}
