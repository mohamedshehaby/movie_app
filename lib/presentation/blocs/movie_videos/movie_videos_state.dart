part of 'movie_videos_bloc.dart';

abstract class MovieVideosState extends Equatable {
  const MovieVideosState();
}

class MovieVideosLoadingState extends MovieVideosState {
  @override
  List<Object> get props => [];
}

class MovieVideosLoadedState extends MovieVideosState {
  final List<VideoEntity> videos;

  const MovieVideosLoadedState({
    required this.videos,
  });

  @override
  List<Object> get props => [videos];
}

class MovieVideosFailureState extends MovieVideosState {
  final Failure failure;

  @override
  List<Object> get props => [failure];

  const MovieVideosFailureState({
    required this.failure,
  });
}
