import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_control_request_model.g.dart';

@JsonSerializable()
class VersionControlRequestModel {
  const VersionControlRequestModel({this.version = "", this.deviceName = ''});

  final String version, deviceName;

  factory VersionControlRequestModel.fromJson(Map<String, Object?> json) =>
      _$VersionControlRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VersionControlRequestModelToJson(this);
}
