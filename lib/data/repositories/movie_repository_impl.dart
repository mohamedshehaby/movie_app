import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/mapper/mapper.dart';
import 'package:movie_app/data/network/error_handler.dart';
import 'package:movie_app/data/network/network_info.dart';
import 'package:movie_app/data/tables/movie_table.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/video_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

import '../../domain/entities/cast_entity.dart';
import '../data_sources/movie_local_data_source.dart';
import '../network/failure.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _remoteDataSource;
  final MovieLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  const MovieRepositoryImpl({
    required MovieRemoteDataSource remoteDataSource,
    required MovieLocalDataSource localDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, List<MovieEntity>>> getTrending() async {
    if (await _networkInfo.isConnected) {
      try {
        final movies = (await _remoteDataSource.getTrending()).movies;
        return Right(movies.toEntity());
      } catch (e) {
        return Left(handleError(e));
      }
    } else {
      return Left(ResponseStatus.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getComingSoon() async {
    if (await _networkInfo.isConnected) {
      try {
        final movies = (await _remoteDataSource.getComingSoon()).movies;
        return Right(movies.toEntity());
      } catch (e) {
        return Left(handleError(e));
      }
    } else {
      return Left(ResponseStatus.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPlayingNow() async {
    if (await _networkInfo.isConnected) {
      try {
        final movies = (await _remoteDataSource.getPlayingNow()).movies;
        return Right(movies.toEntity());
      } catch (e) {
        return Left(handleError(e));
      }
    } else {
      return Left(ResponseStatus.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopular() async {
    if (await _networkInfo.isConnected) {
      try {
        final movies = (await _remoteDataSource.getPopular()).movies;
        return Right(movies.toEntity());
      } catch (e) {
        return Left(handleError(e));
      }
    } else {
      return Left(ResponseStatus.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CastEntity>>> getCast(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final cast = (await _remoteDataSource.getCredits(id)).cast;
        return Right(cast.toEntity());
      } catch (e) {
        return Left(handleError(e));
      }
    } else {
      return Left(ResponseStatus.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<VideoEntity>>> getVideos(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final videos = (await _remoteDataSource.getVideos(id)).videos;
        return Right(videos.toEntity());
      } catch (e) {
        return Left(handleError(e));
      }
    } else {
      return Left(ResponseStatus.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovie(String movieName) async {
    if (await _networkInfo.isConnected) {
      try {
        final movies = (await _remoteDataSource.searchMovie(movieName)).movies;
        return Right(movies.toEntity());
      } catch (e) {
        return Left(handleError(e));
      }
    } else {
      return Left(ResponseStatus.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> checkIfMovieFavourite(int movieId) async {
    try {
      return Right(await _localDataSource.checkIfMovieFavourite(movieId));
    } catch (e) {
      return Left(ResponseStatus.databaseError.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteMovie(int movieId) async {
    try {
      await _localDataSource.deleteMovie(movieId);
      return const Right(null);
    } catch (e) {
      return Left(ResponseStatus.databaseError.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getFavouriteMovies() async {
    try {
      final savedMovies = await _localDataSource.getMovies();
      return Right(
          savedMovies.map((movieTable) => MovieEntity.fromMovieTable(movieTable)).toList());
    } catch (e) {
      return Left(ResponseStatus.databaseError.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveMovie(MovieEntity movieEntity) async {
    try {
      return Right(_localDataSource.saveMovie(MovieTable.formMovieEntity(movieEntity)));
    } catch (e) {
      return Left(ResponseStatus.databaseError.getFailure());
    }
  }
}
