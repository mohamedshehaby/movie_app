import 'package:dartz/dartz.dart';
import 'package:movie_app/data/models/request_token_response/request_token_model.dart';
import 'package:movie_app/data/network/failure.dart';

import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_souce.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSouce;
  final NetworkInfo _networkInfo;

  Future<Either<Failure, RequestTokenModel>> _createRequestToken() async {
    if (await _networkInfo.isConnected) {
      try {
        return Right(await _authRemoteDataSource.createRequestToken());
      } catch (e) {
        return Left(handleError(e));
      }
    } else {
      return Left(ResponseStatus.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> loginUser(Map<String, dynamic> body) async {
    final requestTokenEitherResponse = await _createRequestToken();
    final token1 = requestTokenEitherResponse
        .getOrElse(() => const RequestTokenModel(success: false, expiresAt: '', requestToken: ''))
        .requestToken;

    if (await _networkInfo.isConnected) {
      try {
        body.putIfAbsent('request_token', () => token1);

        final requestTokenModelWithLogin = await _authRemoteDataSource.createSessionWithLogin(body);

        final sessionId = await _authRemoteDataSource
            .createSession({'request_token': requestTokenModelWithLogin.requestToken});

        if (sessionId.isNotEmpty) {
          await _authLocalDataSouce.saveSessionId(sessionId);
          return const Right(true);
        }

        return Left(ResponseStatus.sessionDenied.getFailure());
      } catch (e) {
        return Left(handleError(e));
      }
    } else {
      return Left(ResponseStatus.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logoutUser() async {
    final sessionId = await _authLocalDataSouce.getSessionId();
    if (sessionId != null) {
      Map<String, dynamic> body = {'session_id': sessionId};

      if (await _networkInfo.isConnected) {
        try {
          await Future.wait(
            [_authRemoteDataSource.deleteSessionId(body), _authLocalDataSouce.deleteSessionId()],
          );
          return const Right(null);
        } catch (e) {
          return Left(handleError(e));
        }
      } else {
        return Left(ResponseStatus.noInternetConnection.getFailure());
      }
    } else {
      return const Right(null);
    }
  }

  const AuthRepositoryImpl({
    required AuthRemoteDataSource authRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
    required NetworkInfo networkInfo,
  })  : _authRemoteDataSource = authRemoteDataSource,
        _authLocalDataSouce = authLocalDataSource,
        _networkInfo = networkInfo;
}
