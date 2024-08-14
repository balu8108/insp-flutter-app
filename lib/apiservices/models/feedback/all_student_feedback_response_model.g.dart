// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_student_feedback_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllStudentFeedbackResponseModel _$AllStudentFeedbackResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllStudentFeedbackResponseModel(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => FeedbackModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllStudentFeedbackResponseModelToJson(
        AllStudentFeedbackResponseModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'message': instance.message,
      'data': instance.data,
    };

FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) =>
    FeedbackModel(
      (json['id'] as num?)?.toInt() ?? 0,
      json['studentName'] as String? ?? '',
      json['studentEmail'] as String? ?? '',
      json['feedback'] as String? ?? '',
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$FeedbackModelToJson(FeedbackModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentName': instance.studentName,
      'studentEmail': instance.studentEmail,
      'feedback': instance.feedback,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
