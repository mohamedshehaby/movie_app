import 'package:dartz/dartz.dart';
import 'package:movie_app/data/network/failure.dart';
import 'package:movie_app/domain/entities/entities.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/base_usecase.dart';

import '../entities/params.dart';

class SearchMovieUseCase implements BaseUseCase<MovieSearchParams, List<MovieEntity>> {
  final MovieRepository _movieRepository;

  @override
  Future<Either<Failure, List<MovieEntity>>> call(MovieSearchParams searchMovieParams) {
    return _movieRepository.searchMovie(searchMovieParams.movieName);
  }

  const SearchMovieUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;
}
