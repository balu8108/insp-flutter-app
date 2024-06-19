// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureCardModel _$LectureCardModelFromJson(Map<String, dynamic> json) =>
    LectureCardModel(
      json['id'] as String,
      json['name'] as String,
      json['status'] as String,
      json['description'] as String,
      json['topicName'] as String,
      json['scheduledDate'] as String,
      json['classLevel'] as String,
    );

Map<String, dynamic> _$LectureCardModelToJson(LectureCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'description': instance.description,
      'topicName': instance.topicName,
      'scheduledDate': instance.scheduledDate,
      'classLevel': instance.classLevel,
    };
