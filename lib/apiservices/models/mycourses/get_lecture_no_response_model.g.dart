// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lecture_no_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLectureNoResponseModel _$GetLectureNoResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetLectureNoResponseModel(
      message: json['message'] as String,
      data: (json['data'] as num).toInt(),
    );

Map<String, dynamic> _$GetLectureNoResponseModelToJson(
        GetLectureNoResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
