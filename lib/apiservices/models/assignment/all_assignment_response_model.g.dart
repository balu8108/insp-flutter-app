// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_assignment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllAssignmentResponseModel _$AllAssignmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllAssignmentResponseModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  AllAssignmentModelData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllAssignmentResponseModelToJson(
        AllAssignmentResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AllAssignmentModelData _$AllAssignmentModelDataFromJson(
        Map<String, dynamic> json) =>
    AllAssignmentModelData(
      (json['id'] as num?)?.toInt() ?? 0,
      json['topicId'] as String? ?? '',
      json['topicName'] as String? ?? '',
      json['instructorName'] as String? ?? '',
      json['description'] as String? ?? '',
      json['subjectId'] as String? ?? '',
      json['subjectName'] as String? ?? '',
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
      (json['AssignmentFiles'] as List<dynamic>?)
              ?.map(
                  (e) => LiveClassRoomFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllAssignmentModelDataToJson(
        AllAssignmentModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'topicId': instance.topicId,
      'topicName': instance.topicName,
      'instructorName': instance.instructorName,
      'description': instance.description,
      'AssignmentFiles': instance.assignmentFiles,
    };
