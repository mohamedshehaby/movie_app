import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../entities/params.dart';
import '../entities/video_entity.dart';
import '../repositories/movie_repository.dart';
import 'base_usecase.dart';

class GetMovieVideosUseCase implements BaseUseCase<MovieParams, List<VideoEntity>> {
  final MovieRepository _movieRepository;

  @override
  Future<Either<Failure, List<VideoEntity>>> call(MovieParams movieParams) {
    return _movieRepository.getVideos(movieParams.id);
  }

  const GetMovieVideosUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;
}
