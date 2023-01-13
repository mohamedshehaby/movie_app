import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/entities.dart';

import '../../../data/network/failure.dart';
import '../../../domain/entities/params.dart';
import '../../../domain/usecases/get_movie_videos_usecase.dart';

part 'movie_videos_event.dart';
part 'movie_videos_state.dart';

class MovieVideosBloc extends Bloc<MovieVideosEvent, MovieVideosState> {
  final GetMovieVideosUseCase _getMovieVideosUseCase;

  MovieVideosBloc(GetMovieVideosUseCase getMovieVideosUseCase)
      : _getMovieVideosUseCase = getMovieVideosUseCase,
        super(MovieVideosLoadingState()) {
    on<MovieVideosLoadEvent>((event, emit) async {
      emit(MovieVideosLoadingState());
      (await _getMovieVideosUseCase(MovieParams(id: event.movieId))).fold(
        (failure) {
          emit(MovieVideosFailureState(failure: failure));
        },
        (videos) => emit(MovieVideosLoadedState(videos: videos)),
      );
    });
  }
}
