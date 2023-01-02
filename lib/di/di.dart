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
import 'package:movie_app/domain/usecases/usecases.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

import '../presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

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

  /// [NetworkInfo]
  /// [InternetConnectionChecker] singleton by default
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

  /// [Repositories]
  instance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(remoteDataSource: instance(), networkInfo: instance()),
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

  /// [Blocs]
  instance.registerFactory(() => MovieCarouselBloc(getTrendingMoviesUseCase: instance()));
  instance.registerFactory(() => MovieBackdropBloc());
  instance.registerFactory(
    () => MovieTabbedBloc(
      getPopularMoviesUseCase: instance(),
      getPlayingNowMoviesUseCase: instance(),
      getComingSoonMoviesUseCase: instance(),
    ),
  );

  /// [Logging]
  if (kDebugMode) {
    instance.registerLazySingleton<Logger>(() => Logger());
  }
}
