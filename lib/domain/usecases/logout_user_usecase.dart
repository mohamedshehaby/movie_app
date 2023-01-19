import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/usecases/base_usecase.dart';

import '../../data/network/failure.dart';
import '../entities/params.dart';
import '../repositories/auth_repository.dart';

class LogoutUserUseCase extends BaseUseCase<NoParams, void> {
  final AuthRepository authRepository;

  const LogoutUserUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async => authRepository.logoutUser();
}
