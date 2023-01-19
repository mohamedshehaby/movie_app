import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/usecases/base_usecase.dart';

import '../../data/network/failure.dart';
import '../entities/params.dart';
import '../repositories/auth_repository.dart';

class LoginUserUseCase extends BaseUseCase<LoginRequestParams, bool> {
  final AuthRepository authRepository;

  const LoginUserUseCase({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(LoginRequestParams params) async =>
      authRepository.loginUser(params.toMap());
}
