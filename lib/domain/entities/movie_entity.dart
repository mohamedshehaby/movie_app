import 'package:equatable/equatable.dart';
import 'package:movie_app/data/tables/movie_table.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory MovieEntity.fromMovieTable(MovieTable movieTable) {
    return MovieEntity(
      id: movieTable.id,
      title: movieTable.title,
      posterPath: movieTable.posterPath,
      backdropPath: movieTable.backdropPath,
      overview: movieTable.overview,
      releaseDate: movieTable.releaseDate,
      voteAverage: movieTable.voteAverage,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        backdropPath,
        overview,
        releaseDate,
        voteAverage,
      ];

  @override
  bool get stringify => true;
}
