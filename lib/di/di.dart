import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/network/app_service_client.dart';
import 'package:movie_app/data/network/dio_factory.dart';
import 'package:movie_app/data/network/network_info.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/check_if_favourite_movie_usecase.dart';
import 'package:movie_app/domain/usecases/delete_favourite_movie_usecase.dart';
import 'package:movie_app/domain/usecases/get_favourite_movies_usecase.dart';
import 'package:movie_app/domain/usecases/save_movie_usecase.dart';
import 'package:movie_app/domain/usecases/search_movie_usecase.dart';
import 'package:movie_app/domain/usecases/usecases.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

import '../data/data_sources/movie_local_data_source.dart';
import '../domain/usecases/get_movie_cast_usecase.dart';
import '../domain/usecases/get_movie_videos_usecase.dart';
import '../presentation/blocs/favourite_bloc/favourite_bloc.dart';
import '../presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../presentation/blocs/movie_cast/movie_cast_bloc.dart';
import '../presentation/blocs/movie_videos/movie_videos_bloc.dart';
import '../presentation/blocs/search_movie/search_movie_bloc.dart';

final instance = GetIt.I;

Future init() async {
  // Modified Version of Dio
  final Dio dio = await getDio();
  instance.registerLazySingleton<Dio>(() => dio);

  /// [AppServiceClient]
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(instance()));

  /// [MovieRemoteDataSource]
  instance.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(appServiceClient: instance()),
  );

  /// [MovieLocalDataSource]
  instance.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(),
  );

  /// [NetworkInfo]
  /// [InternetConnectionChecker] singleton by default
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

  /// [Repositories]
  instance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: instance(),
      networkInfo: instance(),
      localDataSource: instance(),
    ),
  );

  /// [UseCases]
  instance.registerLazySingleton<GetPopularMoviesUseCase>(
    () => GetPopularMoviesUseCase(movieRepository: instance()),
  );

  instance.registerLazySingleton<GetComingSoonMoviesUseCase>(
    () => GetComingSoonMoviesUseCase(movieRepository: instance()),
  );

  instance.registerLazySingleton<GetTrendingMoviesUseCase>(
    () => GetTrendingMoviesUseCase(movieRepository: instance()),
  );

  instance.registerLazySingleton<GetPlayingNowMoviesUseCase>(
    () => GetPlayingNowMoviesUseCase(movieRepository: instance()),
  );

  instance.registerLazySingleton<GetMovieCastUseCase>(
    () => GetMovieCastUseCase(movieRepository: instance()),
  );

  instance.registerLazySingleton<GetMovieVideosUseCase>(
    () => GetMovieVideosUseCase(movieRepository: instance()),
  );

  instance.registerLazySingleton<GetFavouriteMoviesUseCase>(
    () => GetFavouriteMoviesUseCase(movieRepository: instance()),
  );

  instance.registerLazySingleton<SaveMovieUseCase>(
    () => SaveMovieUseCase(movieRepository: instance()),
  );

  instance.registerLazySingleton<CheckIfFavouriteMovieUseCase>(
    () => CheckIfFavouriteMovieUseCase(movieRepository: instance()),
  );

  instance.registerLazySingleton<DeleteFavouriteMovieUseCase>(
    () => DeleteFavouriteMovieUseCase(movieRepository: instance()),
  );

  instance.registerLazySingleton<SearchMovieUseCase>(
    () => SearchMovieUseCase(movieRepository: instance()),
  );

  /// [Blocs]
  instance.registerLazySingleton(() => MovieCarouselBloc(getTrendingMoviesUseCase: instance()));

  instance.registerLazySingleton(() => MovieBackdropBloc());

  instance.registerLazySingleton(
    () => MovieTabbedBloc(
      getPopularMoviesUseCase: instance(),
      getPlayingNowMoviesUseCase: instance(),
      getComingSoonMoviesUseCase: instance(),
    ),
  );
  instance.registerFactory(() => MovieCastBloc(instance()));

  instance.registerFactory(() => MovieVideosBloc(instance()));

  instance.registerFactory(() => SearchMovieBloc(instance()));

  instance.registerFactory(
    () => FavouriteBloc(
      instance(),
      instance(),
      instance(),
      instance(),
    ),
  );

  /// [Logging]
  if (kDebugMode) {
    instance.registerLazySingleton<Logger>(() => Logger());
  }
}
