// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_completed_class_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestCompletedClassCardModel _$LatestCompletedClassCardModelFromJson(
        Map<String, dynamic> json) =>
    LatestCompletedClassCardModel(
      json['id'] as String,
      json['topicName'] as String,
      json['topicId'] as String,
      json['mentorName'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$LatestCompletedClassCardModelToJson(
        LatestCompletedClassCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topicName': instance.topicName,
      'topicId': instance.topicId,
      'mentorName': instance.mentorName,
      'description': instance.description,
    };
