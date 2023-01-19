import 'package:json_annotation/json_annotation.dart';

part 'session_response_model.g.dart';

@JsonSerializable()
class SessionResponseModel {
  @JsonKey(defaultValue: false)
  final bool success;
  @JsonKey(name: 'session_id', defaultValue: '')
  final String sessionId;

  const SessionResponseModel({
    required this.success,
    required this.sessionId,
  });

  factory SessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionResponseModelToJson(this);
}
