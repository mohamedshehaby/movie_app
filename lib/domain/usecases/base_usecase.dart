import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';

abstract class BaseUseCase<P, Type> {
  const BaseUseCase();
  Future<Either<Failure, Type>> call(P params);
}
