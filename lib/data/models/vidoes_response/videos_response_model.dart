import 'package:json_annotation/json_annotation.dart';

part 'videos_response_model.g.dart';

@JsonSerializable()
class VideosResponseModel {
  final List<VideoModel>? results;

  VideosResponseModel({
    this.results,
  });

  factory VideosResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VideosResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideosResponseModelToJson(this);
}

@JsonSerializable()
class VideoModel {
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  final String? id;

  VideoModel({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
