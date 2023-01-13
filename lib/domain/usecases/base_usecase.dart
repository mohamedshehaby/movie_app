import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';

abstract class BaseUseCase<P, Type> {
  Future<Either<Failure, Type>> call(P params);
}
