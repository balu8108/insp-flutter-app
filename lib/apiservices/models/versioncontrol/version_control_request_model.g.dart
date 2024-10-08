// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_control_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionControlRequestModel _$VersionControlRequestModelFromJson(
        Map<String, dynamic> json) =>
    VersionControlRequestModel(
      version: json['version'] as String? ?? "",
      deviceName: json['deviceName'] as String? ?? '',
    );

Map<String, dynamic> _$VersionControlRequestModelToJson(
        VersionControlRequestModel instance) =>
    <String, dynamic>{
      'version': instance.version,
      'deviceName': instance.deviceName,
    };
