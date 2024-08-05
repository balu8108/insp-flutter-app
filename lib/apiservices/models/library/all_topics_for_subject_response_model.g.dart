// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_topics_for_subject_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllTopicsForSubjectResponseModel _$AllTopicsForSubjectResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllTopicsForSubjectResponseModel(
      json['status'] as bool? ?? false,
      json['response_message'] as String? ?? '',
      (json['result'] as List<dynamic>?)
              ?.map((e) => AllTopicsForSubjectResponseModelResult.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllTopicsForSubjectResponseModelToJson(
        AllTopicsForSubjectResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'response_message': instance.responseMessage,
      'result': instance.allTopicsForSubjectResponseModelResult,
    };

AllTopicsForSubjectResponseModelResult
    _$AllTopicsForSubjectResponseModelResultFromJson(
            Map<String, dynamic> json) =>
        AllTopicsForSubjectResponseModelResult(
          json['id'] as String? ?? '',
          json['name'] as String? ?? '',
        );

Map<String, dynamic> _$AllTopicsForSubjectResponseModelResultToJson(
        AllTopicsForSubjectResponseModelResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
