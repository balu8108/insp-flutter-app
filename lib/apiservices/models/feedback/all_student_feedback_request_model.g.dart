// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_student_feedback_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllStudentFeedbackRequestModel _$AllStudentFeedbackRequestModelFromJson(
        Map<String, dynamic> json) =>
    AllStudentFeedbackRequestModel(
      limit: (json['limit'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      search: json['search'] as String,
    );

Map<String, dynamic> _$AllStudentFeedbackRequestModelToJson(
        AllStudentFeedbackRequestModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'search': instance.search,
    };
