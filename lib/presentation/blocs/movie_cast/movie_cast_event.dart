part of 'movie_cast_bloc.dart';

abstract class MovieCastEvent extends Equatable {
  const MovieCastEvent();
}

class MovieCastLoadEvent extends MovieCastEvent {
  final int movieId;

  const MovieCastLoadEvent({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
