// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_upload_assignment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestUploadedAssignmentResponseModel
    _$LatestUploadedAssignmentResponseModelFromJson(
            Map<String, dynamic> json) =>
        LatestUploadedAssignmentResponseModel(
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) => LatestUploadedAssignmentModelData.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$LatestUploadedAssignmentResponseModelToJson(
        LatestUploadedAssignmentResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

LatestUploadedAssignmentModelData _$LatestUploadedAssignmentModelDataFromJson(
        Map<String, dynamic> json) =>
    LatestUploadedAssignmentModelData(
      (json['id'] as num?)?.toInt() ?? 0,
      json['topicId'] as String? ?? '',
      json['topicName'] as String? ?? '',
      json['instructorName'] as String? ?? '',
      json['description'] as String? ?? '',
      json['subjectId'] as String? ?? '',
      json['subjectName'] as String? ?? '',
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$LatestUploadedAssignmentModelDataToJson(
        LatestUploadedAssignmentModelData instance) =>
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
    };
