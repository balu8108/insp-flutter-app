// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_assignment_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicAssignmentCardModel _$TopicAssignmentCardModelFromJson(
        Map<String, dynamic> json) =>
    TopicAssignmentCardModel(
      (json['id'] as num).toInt(),
      json['description'] as String,
      (json['AssignmentFiles'] as List<dynamic>)
          .map((e) => LiveClassRoomFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['topicName'] as String,
      json['instructorName'] as String,
    );

Map<String, dynamic> _$TopicAssignmentCardModelToJson(
        TopicAssignmentCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'topicName': instance.topicName,
      'instructorName': instance.instructorName,
      'AssignmentFiles': instance.assignmentFiles,
    };
