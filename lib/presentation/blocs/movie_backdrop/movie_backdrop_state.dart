part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropState extends Equatable {
  const MovieBackdropState();
}

class MovieBackdropInitial extends MovieBackdropState {
  @override
  List<Object> get props => [];
}

class MovieBackdropChangedState extends MovieBackdropState {
  final MovieEntity movie;

  const MovieBackdropChangedState({
    required this.movie,
  });

  @override
  List<Object> get props => [movie];
}
