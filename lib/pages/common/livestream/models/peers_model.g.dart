// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeersDataModel _$PeersDataModelFromJson(Map<String, dynamic> json) =>
    PeersDataModel(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      socketId: json['socketId'] as String? ?? '',
      isAudioBlocked: json['isAudioBlocked'] as bool? ?? false,
      isAudioEnabled: json['isAudioEnabled'] as bool? ?? false,
      isScreenShareBlocked: json['isScreenShareBlocked'] as bool? ?? false,
      isScreenSharingEnabled: json['isScreenSharingEnabled'] as bool? ?? false,
      isTeacher: json['isTeacher'] as bool? ?? false,
      isVideoBlocked: json['isVideoBlocked'] as bool? ?? false,
      isVideoEnabled: json['isVideoEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$PeersDataModelToJson(PeersDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'socketId': instance.socketId,
      'isAudioBlocked': instance.isAudioBlocked,
      'isAudioEnabled': instance.isAudioEnabled,
      'isScreenShareBlocked': instance.isScreenShareBlocked,
      'isScreenSharingEnabled': instance.isScreenSharingEnabled,
      'isTeacher': instance.isTeacher,
      'isVideoBlocked': instance.isVideoBlocked,
      'isVideoEnabled': instance.isVideoEnabled,
    };
