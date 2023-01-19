import 'package:dartz/dartz.dart';
import 'package:movie_app/data/network/failure.dart';

abstract class AuthRepository {
  const AuthRepository();
  Future<Either<Failure, bool>> loginUser(Map<String, dynamic> params);
  Future<Either<Failure, void>> logoutUser();
}
