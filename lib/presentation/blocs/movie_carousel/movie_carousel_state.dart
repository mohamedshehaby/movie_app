part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselLoading extends MovieCarouselState {}

class MovieCarouselFailure extends MovieCarouselState {
  final Failure failure;

  const MovieCarouselFailure({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({
    required this.movies,
    this.defaultIndex = 0,
  });

  @override
  List<Object> get props => [movies, defaultIndex];
}
