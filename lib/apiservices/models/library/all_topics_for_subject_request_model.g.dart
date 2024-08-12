// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_topics_for_subject_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllTopicsForSubjectRequestModel _$AllTopicsForSubjectRequestModelFromJson(
        Map<String, dynamic> json) =>
    AllTopicsForSubjectRequestModel(
      secret_key: json['secret_key'] as String,
      subject_id: json['subject_id'] as String,
    );

Map<String, dynamic> _$AllTopicsForSubjectRequestModelToJson(
        AllTopicsForSubjectRequestModel instance) =>
    <String, dynamic>{
      'secret_key': instance.secret_key,
      'subject_id': instance.subject_id,
    };
