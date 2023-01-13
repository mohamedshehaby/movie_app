import 'package:hive/hive.dart';
import 'package:movie_app/domain/entities/entities.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterPath;
  @HiveField(3)
  final String backdropPath;
  @HiveField(4)
  final String overview;
  @HiveField(5)
  final String releaseDate;
  @HiveField(6)
  final double voteAverage;

  MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory MovieTable.formMovieEntity(MovieEntity movieEntity) {
    return MovieTable(
      id: movieEntity.id,
      title: movieEntity.title,
      posterPath: movieEntity.posterPath,
      backdropPath: movieEntity.backdropPath,
      overview: movieEntity.overview,
      releaseDate: movieEntity.releaseDate,
      voteAverage: movieEntity.voteAverage,
    );
  }
}
