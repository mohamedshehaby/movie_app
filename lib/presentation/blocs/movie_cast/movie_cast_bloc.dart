import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/network/failure.dart';
import '../../../domain/entities/cast_entity.dart';
import '../../../domain/entities/params.dart';
import '../../../domain/usecases/get_movie_cast_usecase.dart';

part 'movie_cast_event.dart';
part 'movie_cast_state.dart';

class MovieCastBloc extends Bloc<MovieCastEvent, MovieCastState> {
  final GetMovieCastUseCase _getMovieCastUseCase;

  MovieCastBloc(GetMovieCastUseCase getMovieCastUseCase)
      : _getMovieCastUseCase = getMovieCastUseCase,
        super(MovieCastLoadingState()) {
    on<MovieCastLoadEvent>((event, emit) async {
      emit(MovieCastLoadingState());
      (await _getMovieCastUseCase(MovieParams(id: event.movieId))).fold(
        (failure) {
          emit(MovieCastFailureState(failure: failure));
        },
        (cast) => emit(MovieCastLoadedState(cast: cast)),
      );
    });
  }
}
