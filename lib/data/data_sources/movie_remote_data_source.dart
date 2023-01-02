import 'package:movie_app/data/models/models.dart';
import 'package:movie_app/data/network/app_service_client.dart';

import '../core/api_constants.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponseModel> getTrending();
  Future<MovieResponseModel> getPopular();
  Future<MovieResponseModel> getPlayingNow();
  Future<MovieResponseModel> getComingSoon();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final AppServiceClient _appServiceClient;

  MovieRemoteDataSourceImpl({
    required AppServiceClient appServiceClient,
  }) : _appServiceClient = appServiceClient;

  @override
  Future<MovieResponseModel> getTrending() {
    return _appServiceClient.getTrending(ApiConstants.apiKey);
  }

  @override
  Future<MovieResponseModel> getPopular() {
    return _appServiceClient.getPopular(ApiConstants.apiKey);
  }

  @override
  Future<MovieResponseModel> getPlayingNow() {
    return _appServiceClient.getPlayingNow(ApiConstants.apiKey);
  }

  @override
  Future<MovieResponseModel> getComingSoon() {
    return _appServiceClient.getComingSoon(ApiConstants.apiKey);
  }
}
