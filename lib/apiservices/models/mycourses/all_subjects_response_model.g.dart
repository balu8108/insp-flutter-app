// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_subjects_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllSubjectsResponseModel _$AllSubjectsResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllSubjectsResponseModel(
      json['status'] as bool? ?? false,
      json['response_message'] as String? ?? '',
      (json['result'] as List<dynamic>?)
              ?.map((e) => AllSubjectsResponseModelResult.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllSubjectsResponseModelToJson(
        AllSubjectsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'response_message': instance.responseMessage,
      'result': instance.allSubjectsResponseModelResults,
    };

AllSubjectsResponseModelResult _$AllSubjectsResponseModelResultFromJson(
        Map<String, dynamic> json) =>
    AllSubjectsResponseModelResult(
      json['id'] as String? ?? '',
      json['name'] as String? ?? '',
    );

Map<String, dynamic> _$AllSubjectsResponseModelResultToJson(
        AllSubjectsResponseModelResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
