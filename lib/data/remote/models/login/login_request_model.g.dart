// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      secret_key: json['secret_key'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      device_os: json['device_os'] as String,
      device_width: json['device_width'] as String,
      device_height: json['device_height'] as String,
      device_manufacturer: json['device_manufacturer'] as String,
      device_id: json['device_id'] as String,
      device_uuid: json['device_uuid'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'secret_key': instance.secret_key,
      'email': instance.email,
      'password': instance.password,
      'device_os': instance.device_os,
      'device_width': instance.device_width,
      'device_height': instance.device_height,
      'device_manufacturer': instance.device_manufacturer,
      'device_id': instance.device_id,
      'device_uuid': instance.device_uuid,
    };
