part of 'movie_response_model.dart';

@JsonSerializable()
class MovieModel {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final int? id;
  final String? title;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final double? popularity;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  const MovieModel({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
