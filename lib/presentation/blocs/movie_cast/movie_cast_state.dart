part of 'movie_cast_bloc.dart';

abstract class MovieCastState extends Equatable {
  const MovieCastState();
}

class MovieCastLoadingState extends MovieCastState {
  @override
  List<Object> get props => [];
}

class MovieCastLoadedState extends MovieCastState {
  final List<CastEntity> cast;

  const MovieCastLoadedState({
    required this.cast,
  });

  @override
  List<Object> get props => [cast];
}

class MovieCastFailureState extends MovieCastState {
  final Failure failure;

  @override
  List<Object> get props => [failure];

  const MovieCastFailureState({
    required this.failure,
  });
}
