// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeTableResponseDataModel _$TimeTableResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    TimeTableResponseDataModel(
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => TimeTableDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TimeTableResponseDataModelToJson(
        TimeTableResponseDataModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

TimeTableDataModel _$TimeTableDataModelFromJson(Map<String, dynamic> json) =>
    TimeTableDataModel(
      (json['id'] as num?)?.toInt() ?? 0,
      json['url'] as String? ?? "",
      json['createdAt'] as String? ?? "",
      json['updatedAt'] as String? ?? "",
    );

Map<String, dynamic> _$TimeTableDataModelToJson(TimeTableDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
