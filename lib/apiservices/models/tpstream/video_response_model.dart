import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_response_model.g.dart';

@JsonSerializable()
class VideoResponseModel {
  const VideoResponseModel({this.playback_url = ''});

  final String playback_url;

  factory VideoResponseModel.fromJson(Map<String, Object?> json) =>
      _$VideoResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VideoResponseModelToJson(this);
}
