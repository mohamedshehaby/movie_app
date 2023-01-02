import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/entities.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    on<MovieBackdropChangedEvent>(_onMovieBackdropChanged);
  }

  _onMovieBackdropChanged(MovieBackdropChangedEvent event, Emitter<MovieBackdropState> emit) {
    emit(MovieBackdropChangedState(movie: event.movie));
  }
}
