import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/mapper/mapper.dart';
import 'package:movie_app/data/network/error_handler.dart';
import 'package:movie_app/data/network/network_info.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

import '../network/failure.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  const MovieRepositoryImpl({
    required MovieRemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
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
}
