import 'package:json_annotation/json_annotation.dart';

part 'request_token_model.g.dart';

@JsonSerializable()
class RequestTokenModel {
  @JsonKey(defaultValue: false)
  final bool success;
  @JsonKey(name: 'expires_at', defaultValue: '')
  final String expiresAt;
  @JsonKey(name: 'request_token', defaultValue: '')
  final String requestToken;

  const RequestTokenModel({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTokenModelToJson(this);
}
