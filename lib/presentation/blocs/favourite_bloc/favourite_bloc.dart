import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/network/failure.dart';
import 'package:movie_app/domain/entities/entities.dart';
import 'package:movie_app/domain/entities/params.dart';

import '../../../domain/usecases/check_if_favourite_movie_usecase.dart';
import '../../../domain/usecases/delete_favourite_movie_usecase.dart';
import '../../../domain/usecases/get_favourite_movies_usecase.dart';
import '../../../domain/usecases/save_movie_usecase.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final SaveMovieUseCase saveMovieUseCase;
  final GetFavouriteMoviesUseCase getFavouriteMoviesUseCase;
  final DeleteFavouriteMovieUseCase deleteFavouriteMovieUseCase;
  final CheckIfFavouriteMovieUseCase checkIfFavouriteMovieUseCase;

  FavouriteBloc(
    this.saveMovieUseCase,
    this.getFavouriteMoviesUseCase,
    this.deleteFavouriteMovieUseCase,
    this.checkIfFavouriteMovieUseCase,
  ) : super(FavouriteInitial()) {
    on<LoadFavouriteMoviesEvent>(_onLoadFavouriteMovies);
    on<DeleteFavouriteMovieEvent>(_onDeleteFavouriteMovie);
    on<ToggleFavouriteMovieEvent>(_onToggleFavouriteMovie);
    on<CheckIfFavouriteMovieEvent>(_onCheckIfFavouriteMovie);
  }

  void _onLoadFavouriteMovies(LoadFavouriteMoviesEvent event, Emitter<FavouriteState> emit) async {
    (await getFavouriteMoviesUseCase(NoParams())).fold(
      (failure) => emit(FavouriteFailureState(failure: failure)),
      (movies) => emit(FavouriteMoviesLoadedState(movies: movies)),
    );
  }

  void _onDeleteFavouriteMovie(
      DeleteFavouriteMovieEvent event, Emitter<FavouriteState> emit) async {
    await deleteFavouriteMovieUseCase(MovieParams(id: event.movieId));
    add(LoadFavouriteMoviesEvent());
  }

  _onToggleFavouriteMovie(ToggleFavouriteMovieEvent event, Emitter<FavouriteState> emit) async {
    final isFavourite = event.isFavourite;

    if (isFavourite) {
      await deleteFavouriteMovieUseCase(MovieParams(id: event.movieEntity.id));
    } else {
      await saveMovieUseCase(event.movieEntity);
    }

    (await checkIfFavouriteMovieUseCase(MovieParams(id: event.movieEntity.id)))
        .fold((failure) => emit(FavouriteFailureState(failure: failure)), (isFavourite) {
      emit(IsFavouriteMovieState(isFavourite: isFavourite));
    });
  }

  _onCheckIfFavouriteMovie(CheckIfFavouriteMovieEvent event, Emitter<FavouriteState> emit) async {
    (await checkIfFavouriteMovieUseCase(MovieParams(id: event.movieId))).fold(
      (failure) => emit(FavouriteFailureState(failure: failure)),
      (isFavourite) => emit(IsFavouriteMovieState(isFavourite: isFavourite)),
    );
  }
}
