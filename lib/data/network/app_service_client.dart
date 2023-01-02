import 'package:dio/dio.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/data/models/models.dart';
import 'package:retrofit/http.dart';

part 'app_service_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET(ApiConstants.trending)
  Future<MovieResponseModel> getTrending(@Query('api_key') String apiKey);

  @GET(ApiConstants.popular)
  Future<MovieResponseModel> getPopular(@Query('api_key') String apiKey);

  @GET(ApiConstants.comingSoon)
  Future<MovieResponseModel> getComingSoon(@Query('api_key') String apiKey);

  @GET(ApiConstants.playingNow)
  Future<MovieResponseModel> getPlayingNow(@Query('api_key') String apiKey);
}
