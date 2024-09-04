// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoRequestModel _$VideoRequestModelFromJson(Map<String, dynamic> json) =>
    VideoRequestModel(
      expires_after_first_usage:
          json['expires_after_first_usage'] as bool? ?? false,
    );

Map<String, dynamic> _$VideoRequestModelToJson(VideoRequestModel instance) =>
    <String, dynamic>{
      'expires_after_first_usage': instance.expires_after_first_usage,
    };
