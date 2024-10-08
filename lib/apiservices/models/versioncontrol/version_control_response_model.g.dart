// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_control_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionControlResponseModel _$VersionControlResponseModelFromJson(
        Map<String, dynamic> json) =>
    VersionControlResponseModel(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      version: json['version'] as String? ?? "",
      description: json['description'] as String? ?? '',
      downloadLink: json['downloadLink'] as String? ?? '',
    );

Map<String, dynamic> _$VersionControlResponseModelToJson(
        VersionControlResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'version': instance.version,
      'description': instance.description,
      'downloadLink': instance.downloadLink,
    };
