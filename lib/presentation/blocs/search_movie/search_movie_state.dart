part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoadingState extends SearchMovieState {}

class SearchMovieLoadedState extends SearchMovieState {
  final List<MovieEntity> movies;

  const SearchMovieLoadedState({
    required this.movies,
  });

  @override
  List<Object> get props => [movies];
}

class SearchMovieFailureState extends SearchMovieState {
  final Failure failure;

  const SearchMovieFailureState({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
