part of 'search_movie_bloc.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();
}

class SearchMovieNameChangedEvent extends SearchMovieEvent {
  final String movieName;

  @override
  List<Object> get props => [movieName];

  const SearchMovieNameChangedEvent({
    required this.movieName,
  });
}
