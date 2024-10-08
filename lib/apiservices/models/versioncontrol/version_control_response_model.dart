import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_control_response_model.g.dart';

@JsonSerializable()
class VersionControlResponseModel {
  const VersionControlResponseModel(
      {this.status = false,
      this.message = '',
      this.version = "",
      this.description = '',
      this.downloadLink = ''});

  final bool status;
  final String message, version, description, downloadLink;

  factory VersionControlResponseModel.fromJson(Map<String, Object?> json) =>
      _$VersionControlResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VersionControlResponseModelToJson(this);
}
