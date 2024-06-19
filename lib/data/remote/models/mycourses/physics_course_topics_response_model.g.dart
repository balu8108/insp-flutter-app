// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'physics_course_topics_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhysicsCourseTopicsResponseModel _$PhysicsCourseTopicsResponseModelFromJson(
        Map<String, dynamic> json) =>
    PhysicsCourseTopicsResponseModel(
      json['status'] as bool? ?? false,
      json['response_message'] as String? ?? '',
      (json['result'] as List<dynamic>?)
              ?.map((e) => PhysicsCourseTopicsResponseModelResult.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PhysicsCourseTopicsResponseModelToJson(
        PhysicsCourseTopicsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'response_message': instance.responseMessage,
      'result': instance.physicsCourseTopicsResponseModelResult,
    };

PhysicsCourseTopicsResponseModelResult
    _$PhysicsCourseTopicsResponseModelResultFromJson(
            Map<String, dynamic> json) =>
        PhysicsCourseTopicsResponseModelResult(
          json['id'] as String? ?? '',
          json['name'] as String? ?? '',
        );

Map<String, dynamic> _$PhysicsCourseTopicsResponseModelResultToJson(
        PhysicsCourseTopicsResponseModelResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
