part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();
}

class FavouriteInitial extends FavouriteState {
  @override
  List<Object> get props => [];
}

class FavouriteMoviesLoadedState extends FavouriteState {
  final List<MovieEntity> movies;

  const FavouriteMoviesLoadedState({
    required this.movies,
  });

  @override
  List<Object> get props => [movies];
}

class FavouriteFailureState extends FavouriteState {
  final Failure failure;

  @override
  List<Object> get props => [failure];

  const FavouriteFailureState({
    required this.failure,
  });
}

class IsFavouriteMovieState extends FavouriteState {
  final bool isFavourite;

  @override
  List<Object> get props => [isFavourite];

  const IsFavouriteMovieState({
    required this.isFavourite,
  });
}
