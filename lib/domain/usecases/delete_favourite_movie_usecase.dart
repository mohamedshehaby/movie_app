import 'package:dartz/dartz.dart';
import 'package:movie_app/data/network/failure.dart';
import 'package:movie_app/domain/usecases/base_usecase.dart';

import '../entities/params.dart';
import '../repositories/movie_repository.dart';

class DeleteFavouriteMovieUseCase implements BaseUseCase<MovieParams, void> {
  final MovieRepository _movieRepository;

  @override
  Future<Either<Failure, void>> call(MovieParams params) {
    return _movieRepository.deleteMovie(params.id);
  }

  const DeleteFavouriteMovieUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;
}
