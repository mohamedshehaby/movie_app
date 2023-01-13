import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';

import '../../data/network/failure.dart';
import '../entities/params.dart';
import '../repositories/movie_repository.dart';
import 'base_usecase.dart';

class GetMovieCastUseCase implements BaseUseCase<MovieParams, List<CastEntity>> {
  final MovieRepository _movieRepository;

  @override
  Future<Either<Failure, List<CastEntity>>> call(MovieParams movieParams) {
    return _movieRepository.getCast(movieParams.id);
  }

  const GetMovieCastUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;
}
