// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResponseModel _$VideoResponseModelFromJson(Map<String, dynamic> json) =>
    VideoResponseModel(
      playback_url: json['playback_url'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$VideoResponseModelToJson(VideoResponseModel instance) =>
    <String, dynamic>{
      'playback_url': instance.playback_url,
      'code': instance.code,
    };
