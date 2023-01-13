part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavouriteMoviesEvent extends FavouriteEvent {}

class DeleteFavouriteMovieEvent extends FavouriteEvent {
  final int movieId;

  const DeleteFavouriteMovieEvent({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}

class ToggleFavouriteMovieEvent extends FavouriteEvent {
  final MovieEntity movieEntity;
  final bool isFavourite;

  const ToggleFavouriteMovieEvent({
    required this.movieEntity,
    required this.isFavourite,
  });

  @override
  List<Object> get props => [movieEntity, isFavourite];
}

class CheckIfFavouriteMovieEvent extends FavouriteEvent {
  final int movieId;

  @override
  List<Object> get props => [movieId];

  const CheckIfFavouriteMovieEvent({
    required this.movieId,
  });
}
