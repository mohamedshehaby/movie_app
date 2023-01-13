import 'package:movie_app/common/extensions/extensions.dart';
import 'package:movie_app/data/models/models.dart';
import 'package:movie_app/domain/entities/entities.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/video_entity.dart';
import '../models/credits_response/credits_response_model.dart';
import '../models/vidoes_response/videos_response_model.dart';

extension MovieModelMapper on MovieModel? {
  MovieEntity toEntity() {
    return MovieEntity(
      id: (this?.id).orZero,
      title: (this?.title).orEmpty,
      posterPath: (this?.posterPath).orEmpty,
      backdropPath: (this?.backdropPath).orEmpty,
      overview: (this?.overview).orEmpty,
      releaseDate: (this?.releaseDate).orEmpty,
      voteAverage: (this?.voteAverage).orZero,
    );
  }
}

extension MovieModelListMapper on List<MovieModel>? {
  List<MovieEntity> toEntity() {
    return (this == null)
        ? <MovieEntity>[]
        : this!.map((movieModel) => movieModel.toEntity()).toList();
  }
}

extension CastModelMapper on CastModel? {
  CastEntity toEntity() {
    return CastEntity(
      creditId: (this?.creditId).orEmpty,
      name: (this?.name).orEmpty,
      profilePath: (this?.profilePath).orEmpty,
      character: (this?.character).orEmpty,
    );
  }
}

extension CastModelListMapper on List<CastModel>? {
  List<CastEntity> toEntity() {
    return (this == null)
        ? <CastEntity>[]
        : this!.map((castModel) => castModel.toEntity()).toList();
  }
}

extension VideosModelMapper on VideoModel? {
  VideoEntity toEntity() {
    return VideoEntity(
      name: (this?.name).orEmpty,
      key: (this?.key).orEmpty,
      type: (this?.type).orEmpty,
    );
  }
}

extension VideosModelListMapper on List<VideoModel>? {
  List<VideoEntity> toEntity() {
    return (this == null)
        ? <VideoEntity>[]
        : this!.map((videoModel) => videoModel.toEntity()).toList();
  }
}

// extension MovieResponseMapper on MovieResponseModel? {
//   MovieResponseModel notNull() {
//     return MovieResponseModel();
//   }
// }
