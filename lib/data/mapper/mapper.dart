import 'package:movie_app/common/extensions/extensions.dart';
import 'package:movie_app/data/models/models.dart';
import 'package:movie_app/domain/entities/entities.dart';

extension MovieModelMapper on MovieModel? {
  MovieEntity toEntity() {
    return MovieEntity(
      id: (this?.id).orZero,
      title: (this?.title).orEmpty,
      posterPath: (this?.posterPath).orEmpty,
      backdropPath: (this?.backdropPath).orEmpty,
      overview: this?.overview,
      releaseDate: this?.releaseDate,
      voteAverage: this?.voteAverage,
    );
  }
}

extension MovieModelListMapper on List<MovieModel>? {
  List<MovieEntity> toEntity() {
    return this == null
        ? <MovieEntity>[]
        : this!.map((movieModel) => movieModel.toEntity()).toList();
  }
}

// extension MovieResponseMapper on MovieResponseModel? {
//   MovieResponseModel notNull() {
//     return MovieResponseModel();
//   }
// }
