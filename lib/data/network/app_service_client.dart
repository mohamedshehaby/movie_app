import 'package:dio/dio.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/data/models/credits_response/credits_response_model.dart';
import 'package:movie_app/data/models/models.dart';
import 'package:retrofit/http.dart';

import '../models/request_token_response/request_token_model.dart';
import '../models/session_response/session_response_model.dart';
import '../models/vidoes_response/videos_response_model.dart';

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

  @GET('movie/{id}/credits')
  Future<CreditsResponseModel> getCredits(@Path('id') int id, @Query('api_key') String apiKey);

  @GET('movie/{id}/videos')
  Future<VideosResponseModel> getVideos(@Path('id') int id, @Query('api_key') String apiKey);

  @GET(ApiConstants.searchMovie)
  Future<MovieResponseModel> searchMovie(
    @Query('api_key') String apiKey,
    @Query('query') String movieName,
  );

  @GET(ApiConstants.createRequestToken)
  Future<RequestTokenModel> createRequestToken(@Query('api_key') String apiKey);

  @POST(ApiConstants.createSessionWithLogin)
  Future<RequestTokenModel> createSessionWithLogin(
      @Body() Map<String, dynamic> body, @Query('api_key') String apiKey);

  @POST(ApiConstants.createSessionWithLogin)
  Future<SessionResponseModel> createSession(
      @Body() Map<String, dynamic> body, @Query('api_key') String apiKey);

  @POST(ApiConstants.deleteSessionId)
  Future<bool> deleteSessionId(@Body() Map<String, dynamic> body, @Query('api_key') String apiKey);
}
