import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/params.dart';

import '../../data/network/failure.dart';

abstract class BaseUseCase<P extends Params, Type> {
  Future<Either<Failure, Type>> call(P params);
}
