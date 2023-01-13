part of 'movie_videos_bloc.dart';

abstract class MovieVideosEvent extends Equatable {
  const MovieVideosEvent();
}

class MovieVideosLoadEvent extends MovieVideosEvent {
  final int movieId;

  const MovieVideosLoadEvent({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
