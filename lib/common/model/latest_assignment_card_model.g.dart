// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_assignment_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestAssignmentCardModel _$LatestAssignmentCardModelFromJson(
        Map<String, dynamic> json) =>
    LatestAssignmentCardModel(
      json['id'] as String,
      json['topicName'] as String,
      json['topicId'] as String,
      json['instructorName'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$LatestAssignmentCardModelToJson(
        LatestAssignmentCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topicName': instance.topicName,
      'topicId': instance.topicId,
      'instructorName': instance.instructorName,
      'description': instance.description,
    };
