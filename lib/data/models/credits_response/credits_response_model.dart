import 'package:json_annotation/json_annotation.dart';

part 'credits_response_model.g.dart';

@JsonSerializable()
class CreditsResponseModel {
  final List<CastModel>? cast;

  CreditsResponseModel({
    this.cast,
  });

  factory CreditsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreditsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsResponseModelToJson(this);
}

@JsonSerializable()
class CastModel {
  final bool? adult;
  final int? gender;
  final int? id;
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;
  final String? name;
  @JsonKey(name: 'original_name')
  final String? originalName;
  final double? popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'cast_id')
  final int? castId;
  final String? character;
  @JsonKey(name: 'credit_id')
  final String? creditId;
  final int? order;

  CastModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) => _$CastModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);
}
