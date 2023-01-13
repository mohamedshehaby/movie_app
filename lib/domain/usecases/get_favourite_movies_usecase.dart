import 'package:dartz/dartz.dart';
import 'package:movie_app/data/network/failure.dart';
import 'package:movie_app/domain/entities/entities.dart';
import 'package:movie_app/domain/entities/params.dart';
import 'package:movie_app/domain/usecases/base_usecase.dart';

import '../repositories/movie_repository.dart';

class GetFavouriteMoviesUseCase implements BaseUseCase<NoParams, List<MovieEntity>> {
  final MovieRepository _movieRepository;

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) {
    return _movieRepository.getFavouriteMovies();
  }

  const GetFavouriteMoviesUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;
}
