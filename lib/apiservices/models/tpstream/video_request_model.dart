import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_request_model.g.dart';

@JsonSerializable()
class VideoRequestModel {
  const VideoRequestModel({this.expires_after_first_usage = false});

  final bool expires_after_first_usage;

  factory VideoRequestModel.fromJson(Map<String, Object?> json) =>
      _$VideoRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VideoRequestModelToJson(this);
}
