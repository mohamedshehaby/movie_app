import 'package:dartz/dartz.dart';
import 'package:movie_app/data/network/failure.dart';
import 'package:movie_app/domain/entities/entities.dart';
import 'package:movie_app/domain/usecases/base_usecase.dart';

import '../repositories/movie_repository.dart';

class SaveMovieUseCase implements BaseUseCase<MovieEntity, void> {
  final MovieRepository _movieRepository;

  @override
  Future<Either<Failure, void>> call(MovieEntity params) {
    return _movieRepository.saveMovie(params);
  }

  const SaveMovieUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;
}
