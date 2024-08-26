// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polldata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollDataModel _$PollDataModelFromJson(Map<String, dynamic> json) =>
    PollDataModel(
      noOfOptions: (json['noOfOptions'] as num?)?.toInt() ?? 0,
      questionNo: (json['questionNo'] as num?)?.toInt() ?? 0,
      time: (json['time'] as num?)?.toInt() ?? 0,
      correctAnswers: (json['correctAnswers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      questionId: json['questionId'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$PollDataModelToJson(PollDataModel instance) =>
    <String, dynamic>{
      'correctAnswers': instance.correctAnswers,
      'noOfOptions': instance.noOfOptions,
      'questionNo': instance.questionNo,
      'time': instance.time,
      'questionId': instance.questionId,
      'type': instance.type,
    };
