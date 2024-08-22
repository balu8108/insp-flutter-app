// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      classType: json['classType'] as String,
      classLevel: json['classLevel'] as String,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'classType': instance.classType,
      'classLevel': instance.classLevel,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };
