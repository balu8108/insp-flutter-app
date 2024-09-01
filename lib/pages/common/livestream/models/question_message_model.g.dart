// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionMessageModel _$QuestionMessageModelFromJson(
        Map<String, dynamic> json) =>
    QuestionMessageModel(
      questionMsg: json['questionMsg'] as String? ?? '',
      peerDetails: json['peerDetails'] == null
          ? const PeerDetail(id: '', name: '')
          : PeerDetail.fromJson(json['peerDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionMessageModelToJson(
        QuestionMessageModel instance) =>
    <String, dynamic>{
      'questionMsg': instance.questionMsg,
      'peerDetails': instance.peerDetails,
    };
