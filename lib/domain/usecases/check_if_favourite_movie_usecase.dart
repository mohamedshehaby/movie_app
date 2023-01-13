import 'package:dartz/dartz.dart';
import 'package:movie_app/data/network/failure.dart';
import 'package:movie_app/domain/usecases/base_usecase.dart';

import '../entities/params.dart';
import '../repositories/movie_repository.dart';

class CheckIfFavouriteMovieUseCase implements BaseUseCase<MovieParams, bool> {
  final MovieRepository _movieRepository;

  @override
  Future<Either<Failure, bool>> call(MovieParams params) {
    return _movieRepository.checkIfMovieFavourite(params.id);
  }

  const CheckIfFavouriteMovieUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;
}
