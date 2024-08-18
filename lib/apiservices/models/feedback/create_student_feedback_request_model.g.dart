// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_student_feedback_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateStudentFeedbackRequestModel _$CreateStudentFeedbackRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateStudentFeedbackRequestModel(
      feedback: json['feedback'] as String,
      studentEmail: json['studentEmail'] as String,
      studentName: json['studentName'] as String,
    );

Map<String, dynamic> _$CreateStudentFeedbackRequestModelToJson(
        CreateStudentFeedbackRequestModel instance) =>
    <String, dynamic>{
      'feedback': instance.feedback,
      'studentEmail': instance.studentEmail,
      'studentName': instance.studentName,
    };
