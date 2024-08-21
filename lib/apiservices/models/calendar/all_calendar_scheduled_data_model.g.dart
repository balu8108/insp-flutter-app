// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_calendar_scheduled_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCalendarScheduledDataModel _$AllCalendarScheduledDataModelFromJson(
        Map<String, dynamic> json) =>
    AllCalendarScheduledDataModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CalendarModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllCalendarScheduledDataModelToJson(
        AllCalendarScheduledDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CalendarModel _$CalendarModelFromJson(Map<String, dynamic> json) =>
    CalendarModel(
      (json['id'] as num?)?.toInt() ?? 0,
      json['title'] as String? ?? "",
      json['classType'] as String? ?? "",
      json['classLevel'] as String? ?? "",
      json['start'] as String? ?? "",
      json['end'] as String? ?? "",
    );

Map<String, dynamic> _$CalendarModelToJson(CalendarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'classType': instance.classType,
      'classLevel': instance.classLevel,
      'start': instance.start,
      'end': instance.end,
    };
