import 'package:movie_app/data/network/app_service_client.dart';

import '../core/api_constants.dart';
import '../models/request_token_response/request_token_model.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<RequestTokenModel> createRequestToken();
  Future<RequestTokenModel> createSessionWithLogin(Map<String, dynamic> body);
  Future<String> createSession(Map<String, dynamic> body);
  Future<bool> deleteSessionId(Map<String, dynamic> body);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AppServiceClient _appServiceClient;

  const AuthRemoteDataSourceImpl({
    required AppServiceClient appServiceClient,
  }) : _appServiceClient = appServiceClient;

  @override
  Future<RequestTokenModel> createRequestToken() {
    return _appServiceClient.createRequestToken(ApiConstants.apiKey);
  }

  @override
  Future<String> createSession(Map<String, dynamic> body) async {
    final sessionModel = await _appServiceClient.createSession(body, ApiConstants.apiKey);
    return sessionModel.success ? sessionModel.sessionId : '';
  }

  @override
  Future<RequestTokenModel> createSessionWithLogin(
    Map<String, dynamic> body,
  ) {
    return _appServiceClient.createSessionWithLogin(body, ApiConstants.apiKey);
  }

  @override
  Future<bool> deleteSessionId(Map<String, dynamic> body) async {
    return _appServiceClient.deleteSessionId(body, ApiConstants.apiKey);
  }
}
