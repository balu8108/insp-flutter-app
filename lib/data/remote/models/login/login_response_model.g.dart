// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      json['status'] as bool? ?? false,
      json['response_message'] as String? ?? '',
      json['result'] == null
          ? const LoginResponseModelResult()
          : LoginResponseModelResult.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'response_message': instance.responseMessage,
      'result': instance.loginResponseModelResult,
    };

LoginResponseModelResult _$LoginResponseModelResultFromJson(
        Map<String, dynamic> json) =>
    LoginResponseModelResult(
      json['id'] as String? ?? '',
      json['name'] as String? ?? '',
      json['mobile'] as String? ?? '',
      json['email'] as String? ?? '',
      json['opting_classes'] as String? ?? '',
      json['present_class'] as String? ?? '',
      json['token'] as String? ?? '',
      json['status'] as String? ?? '',
      (json['paid_status'] as num?)?.toInt() ?? 0,
      (json['user_type'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$LoginResponseModelResultToJson(
        LoginResponseModelResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobile': instance.mobile,
      'email': instance.email,
      'opting_classes': instance.optingClasses,
      'present_class': instance.presentClass,
      'token': instance.token,
      'status': instance.status,
      'paid_status': instance.paidStatus,
      'user_type': instance.userType,
    };
