// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      msg: json['msg'] as String? ?? '',
      peerDetails: json['peerDetails'] == null
          ? const PeerDetail(id: '', name: '')
          : PeerDetail.fromJson(json['peerDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'peerDetails': instance.peerDetails,
    };

PeerDetail _$PeerDetailFromJson(Map<String, dynamic> json) => PeerDetail(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$PeerDetailToJson(PeerDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
