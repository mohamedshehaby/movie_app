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

class LoginRequestParams extends Params {
  final String username;
  final String password;

  const LoginRequestParams({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [username, password];
}
