// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_student_feedback_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateStudentFeedbackResponseModel _$CreateStudentFeedbackResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateStudentFeedbackResponseModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => FeedbackModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateStudentFeedbackResponseModelToJson(
        CreateStudentFeedbackResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
