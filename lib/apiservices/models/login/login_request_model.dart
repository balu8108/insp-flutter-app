import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  const LoginRequestModel(
      {required this.secret_key,
      required this.email,
      required this.password,
      required this.device_os,
      required this.device_width,
      required this.device_height,
      required this.device_manufacturer,
      required this.device_id,
      required this.device_uuid});

  final String secret_key;
  final String email;
  final String password;
  final String device_os;
  final String device_width;
  final String device_height;
  final String device_manufacturer;
  final String device_id;
  final String device_uuid;

  factory LoginRequestModel.fromJson(Map<String, Object?> json) =>
      _$LoginRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
