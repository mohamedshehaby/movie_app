import 'package:movie_app/data/models/credits_response/credits_response_model.dart';
import 'package:movie_app/data/models/models.dart';
import 'package:movie_app/data/network/app_service_client.dart';

import '../core/api_constants.dart';
import '../models/vidoes_response/videos_response_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponseModel> getTrending();
  Future<MovieResponseModel> getPopular();
  Future<MovieResponseModel> getPlayingNow();
  Future<MovieResponseModel> getComingSoon();
  Future<CreditsResponseModel> getCredits(int id);
  Future<VideosResponseModel> getVideos(int id);
  Future<MovieResponseModel> searchMovie(String movieName);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final AppServiceClient _appServiceClient;

  MovieRemoteDataSourceImpl({
    required AppServiceClient appServiceClient,
  }) : _appServiceClient = appServiceClient;

  @override
  Future<MovieResponseModel> getTrending() async {
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

  @override
  Future<CreditsResponseModel> getCredits(int id) {
    return _appServiceClient.getCredits(id, ApiConstants.apiKey);
  }

  @override
  Future<VideosResponseModel> getVideos(int id) {
    return _appServiceClient.getVideos(id, ApiConstants.apiKey);
  }

  @override
  Future<MovieResponseModel> searchMovie(String movieName) {
    return _appServiceClient.searchMovie(ApiConstants.apiKey, movieName);
  }
}
