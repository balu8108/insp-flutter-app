// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoRequestModel _$VideoRequestModelFromJson(Map<String, dynamic> json) =>
    VideoRequestModel(
      expires_after_first_usage:
          json['expires_after_first_usage'] as bool? ?? false,
      annotations: (json['annotations'] as List<dynamic>?)
              ?.map((e) => Annotation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$VideoRequestModelToJson(VideoRequestModel instance) =>
    <String, dynamic>{
      'expires_after_first_usage': instance.expires_after_first_usage,
      'annotations': instance.annotations,
    };

Annotation _$AnnotationFromJson(Map<String, dynamic> json) => Annotation(
      type: json['type'] as String,
      text: json['text'] as String,
      opacity: (json['opacity'] as num).toDouble(),
      color: json['color'] as String,
      size: (json['size'] as num).toInt(),
    );

Map<String, dynamic> _$AnnotationToJson(Annotation instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'opacity': instance.opacity,
      'color': instance.color,
      'size': instance.size,
    };

StaticAnnotation _$StaticAnnotationFromJson(Map<String, dynamic> json) =>
    StaticAnnotation(
      type: json['type'] as String,
      text: json['text'] as String,
      opacity: (json['opacity'] as num).toDouble(),
      color: json['color'] as String,
      size: (json['size'] as num).toInt(),
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
    );

Map<String, dynamic> _$StaticAnnotationToJson(StaticAnnotation instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'opacity': instance.opacity,
      'color': instance.color,
      'size': instance.size,
      'x': instance.x,
      'y': instance.y,
    };

DynamicAnnotation _$DynamicAnnotationFromJson(Map<String, dynamic> json) =>
    DynamicAnnotation(
      type: json['type'] as String,
      text: json['text'] as String,
      opacity: (json['opacity'] as num).toDouble(),
      color: json['color'] as String,
      size: (json['size'] as num).toInt(),
      interval: (json['interval'] as num).toInt(),
      skip: (json['skip'] as num).toInt(),
    );

Map<String, dynamic> _$DynamicAnnotationToJson(DynamicAnnotation instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'opacity': instance.opacity,
      'color': instance.color,
      'size': instance.size,
      'interval': instance.interval,
      'skip': instance.skip,
    };
