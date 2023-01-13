import 'package:equatable/equatable.dart';

abstract class Params extends Equatable {
  const Params();
}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}

class MovieParams extends Params {
  final int id;

  const MovieParams({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class MovieSearchParams extends Params {
  final String movieName;

  const MovieSearchParams({
    required this.movieName,
  });

  @override
  List<Object> get props => [movieName];
}
