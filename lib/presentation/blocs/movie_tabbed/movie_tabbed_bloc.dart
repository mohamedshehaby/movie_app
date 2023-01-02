import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/network/failure.dart';
import 'package:movie_app/domain/entities/params.dart';

import '../../../common/enums.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/usecases.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  final GetPlayingNowMoviesUseCase _getPlayingNowMoviesUseCase;
  final GetComingSoonMoviesUseCase _getComingSoonMoviesUseCase;

  MovieTabbedBloc({
    required GetPopularMoviesUseCase getPopularMoviesUseCase,
    required GetPlayingNowMoviesUseCase getPlayingNowMoviesUseCase,
    required GetComingSoonMoviesUseCase getComingSoonMoviesUseCase,
  })  : _getPopularMoviesUseCase = getPopularMoviesUseCase,
        _getPlayingNowMoviesUseCase = getPlayingNowMoviesUseCase,
        _getComingSoonMoviesUseCase = getComingSoonMoviesUseCase,
        super(const MovieTabbedLoadingState()) {
    on<MovieTabbedChangedEvent>(_onMovieTabbedChanged);
  }

  _onMovieTabbedChanged(MovieTabbedChangedEvent event, Emitter<MovieTabbedState> emit) async {
    emit(MovieTabbedLoadingState(moviesType: event.moviesType));
    final Either<Failure, List<MovieEntity>> movieEither;
    switch (event.moviesType) {
      case MoviesType.popular:
        movieEither = await _getPopularMoviesUseCase(NoParams());
        movieEither.fold(
          (failure) =>
              emit(MovieTabbedFailureState(failure: failure, moviesType: event.moviesType)),
          (movies) => emit(MovieTabbedChangedState(movies: movies, moviesType: event.moviesType)),
        );
        break;
      case MoviesType.playingNow:
        movieEither = await _getPlayingNowMoviesUseCase(NoParams());
        movieEither.fold(
          (failure) =>
              emit(MovieTabbedFailureState(failure: failure, moviesType: event.moviesType)),
          (movies) => emit(MovieTabbedChangedState(movies: movies, moviesType: event.moviesType)),
        );
        break;
      case MoviesType.comingSoon:
        movieEither = await _getComingSoonMoviesUseCase(NoParams());
        movieEither.fold(
          (failure) =>
              emit(MovieTabbedFailureState(failure: failure, moviesType: event.moviesType)),
          (movies) => emit(MovieTabbedChangedState(movies: movies, moviesType: event.moviesType)),
        );
        break;
      default:
    }
  }
}
