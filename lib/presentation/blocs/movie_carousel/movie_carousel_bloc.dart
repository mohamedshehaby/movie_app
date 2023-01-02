import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/network/failure.dart';
import 'package:movie_app/domain/entities/entities.dart';
import 'package:movie_app/domain/entities/params.dart';

import '../../../domain/usecases/get_trending_movies_usecase.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrendingMoviesUseCase _getTrendingMoviesUseCase;

  MovieCarouselBloc({required GetTrendingMoviesUseCase getTrendingMoviesUseCase})
      : _getTrendingMoviesUseCase = getTrendingMoviesUseCase,
        super(MovieCarouselLoading()) {
    on<MovieCarouselLoadEvent>(_onMovieCarouselLoad);
  }

  _onMovieCarouselLoad(MovieCarouselLoadEvent event, Emitter<MovieCarouselState> emit) async {
    emit(MovieCarouselLoading());
    (await _getTrendingMoviesUseCase(NoParams())).fold((failure) {
      emit(MovieCarouselFailure(failure: failure));
    }, (movies) {
      emit(MovieCarouselLoaded(movies: movies, defaultIndex: event.defaultIndex));
    });
  }
}
