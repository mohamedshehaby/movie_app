import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/entities.dart';

import '../../data/network/failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getTrending();
  Future<Either<Failure, List<MovieEntity>>> getPopular();
  Future<Either<Failure, List<MovieEntity>>> getPlayingNow();
  Future<Either<Failure, List<MovieEntity>>> getComingSoon();
}
