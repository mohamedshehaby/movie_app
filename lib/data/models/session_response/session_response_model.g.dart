// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionResponseModel _$SessionResponseModelFromJson(
        Map<String, dynamic> json) =>
    SessionResponseModel(
      success: json['success'] as bool? ?? false,
      sessionId: json['session_id'] as String? ?? '',
    );

Map<String, dynamic> _$SessionResponseModelToJson(
        SessionResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'session_id': instance.sessionId,
    };
