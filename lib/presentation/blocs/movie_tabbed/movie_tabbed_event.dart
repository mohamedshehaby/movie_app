part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();
}

class MovieTabbedChangedEvent extends MovieTabbedEvent {
  final MoviesType moviesType;

  const MovieTabbedChangedEvent({
    this.moviesType = MoviesType.popular,
  });

  @override
  List<Object> get props => [moviesType];
}
