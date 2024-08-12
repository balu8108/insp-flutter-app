// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_assignment_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureAssignmentCardModel _$LectureAssignmentCardModelFromJson(
        Map<String, dynamic> json) =>
    LectureAssignmentCardModel(
      json['id'] as String,
      json['description'] as String,
      (json['AssignmentFiles'] as List<dynamic>)
          .map((e) => LiveClassRoomFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LectureAssignmentCardModelToJson(
        LectureAssignmentCardModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
      'AssignmentFiles': instance.assignmentFiles,
    };
