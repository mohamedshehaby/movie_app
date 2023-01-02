import 'package:dartz/dartz.dart';
import 'package:movie_app/data/network/failure.dart';
import 'package:movie_app/domain/entities/entities.dart';
import 'package:movie_app/domain/entities/params.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/base_usecase.dart';

class GetPlayingNowMoviesUseCase
    implements BaseUseCase<NoParams, List<MovieEntity>> {
  final MovieRepository _movieRepository;

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams noParams) {
    return _movieRepository.getPlayingNow();
  }

  const GetPlayingNowMoviesUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;
}
