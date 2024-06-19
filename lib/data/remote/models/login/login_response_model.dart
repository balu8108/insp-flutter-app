import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  const LoginResponseModel(
      [this.status = false,
      this.responseMessage = '',
      this.loginResponseModelResult = const LoginResponseModelResult()]);

  final bool status;
  @JsonKey(name: 'response_message')
  final String responseMessage;
  @JsonKey(name: 'result')
  final LoginResponseModelResult loginResponseModelResult;

  factory LoginResponseModel.fromJson(Map<String, Object?> json) =>
      _$LoginResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class LoginResponseModelResult {
  const LoginResponseModelResult(
      [this.id = '',
      this.name = '',
      this.mobile = '',
      this.email = '',
      this.optingClasses = '',
      this.presentClass = '',
      this.token = '',
      this.status = '',
      this.paidStatus = 0,
      this.userType = 0]);

  final String id, name, mobile, email;
  @JsonKey(name: 'opting_classes')
  final String optingClasses;
  @JsonKey(name: 'present_class')
  final String presentClass;
  final String token, status;
  @JsonKey(name: 'paid_status')
  final int paidStatus;
  @JsonKey(name: 'user_type')
  final int userType;

  factory LoginResponseModelResult.fromJson(Map<String, Object?> json) =>
      _$LoginResponseModelResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelResultToJson(this);
}
