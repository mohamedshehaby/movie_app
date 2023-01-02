part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final MoviesType moviesType;

  const MovieTabbedState({this.moviesType = MoviesType.popular});

  @override
  List<Object> get props => [moviesType];
}

class MovieTabbedLoadingState extends MovieTabbedState {
  const MovieTabbedLoadingState({super.moviesType});
}

class MovieTabbedChangedState extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabbedChangedState({
    super.moviesType,
    required this.movies,
  });

  @override
  List<Object> get props => [movies, moviesType];
}

class MovieTabbedFailureState extends MovieTabbedState {
  final Failure failure;

  const MovieTabbedFailureState({
    super.moviesType,
    required this.failure,
  });

  @override
  List<Object> get props => [failure, moviesType];
}
