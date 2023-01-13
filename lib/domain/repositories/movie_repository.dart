import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/entities.dart';

import '../../data/network/failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getTrending();
  Future<Either<Failure, List<MovieEntity>>> getPopular();
  Future<Either<Failure, List<MovieEntity>>> getPlayingNow();
  Future<Either<Failure, List<MovieEntity>>> getComingSoon();
  Future<Either<Failure, List<CastEntity>>> getCast(int id);
  Future<Either<Failure, List<VideoEntity>>> getVideos(int id);
  Future<Either<Failure, List<MovieEntity>>> searchMovie(String movieName);

  Future<Either<Failure, void>> saveMovie(MovieEntity movieEntity);
  Future<Either<Failure, List<MovieEntity>>> getFavouriteMovies();
  Future<Either<Failure, void>> deleteMovie(int movieId);
  Future<Either<Failure, bool>> checkIfMovieFavourite(int movieId);
}
