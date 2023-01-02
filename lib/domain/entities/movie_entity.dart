import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String? overview;
  final String? releaseDate;
  final double? voteAverage;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    this.overview,
    this.releaseDate,
    this.voteAverage,
  });

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
