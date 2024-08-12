// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lecture_no_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLectureNoRequestModel _$GetLectureNoRequestModelFromJson(
        Map<String, dynamic> json) =>
    GetLectureNoRequestModel(
      classLevel: json['classLevel'] as String,
      classType: json['classType'] as String,
      subjectName: json['subjectName'] as String,
      isSoloClass: json['isSoloClass'] as bool,
    );

Map<String, dynamic> _$GetLectureNoRequestModelToJson(
        GetLectureNoRequestModel instance) =>
    <String, dynamic>{
      'classLevel': instance.classLevel,
      'classType': instance.classType,
      'subjectName': instance.subjectName,
      'isSoloClass': instance.isSoloClass,
    };
