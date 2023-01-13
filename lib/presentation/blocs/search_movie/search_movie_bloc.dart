import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/params.dart';

import '../../../data/network/failure.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/search_movie_usecase.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovieUseCase searchMovieUseCase;

  SearchMovieBloc(this.searchMovieUseCase) : super(SearchMovieInitial()) {
    on<SearchMovieNameChangedEvent>((event, emit) async {
      emit(SearchMovieLoadingState());
      (await searchMovieUseCase(MovieSearchParams(movieName: event.movieName))).fold(
        (failure) => emit(
          SearchMovieFailureState(failure: failure),
        ),
        (movies) => emit(SearchMovieLoadedState(movies: movies)),
      );
    });
  }
}
