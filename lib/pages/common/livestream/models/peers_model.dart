import 'package:freezed_annotation/freezed_annotation.dart';

part 'peers_model.g.dart';

@JsonSerializable()
class PeersDataModel {
  const PeersDataModel({
    this.id = '',
    this.email = '',
    this.name = '',
    this.socketId = '',
    this.isAudioBlocked = false,
    this.isAudioEnabled = false,
    this.isScreenShareBlocked = false,
    this.isScreenSharingEnabled = false,
    this.isTeacher = false,
    this.isVideoBlocked = false,
    this.isVideoEnabled = false,
  });

  final String id, email, name, socketId;
  final bool isAudioBlocked,
      isAudioEnabled,
      isScreenShareBlocked,
      isScreenSharingEnabled,
      isTeacher,
      isVideoBlocked,
      isVideoEnabled;

  factory PeersDataModel.fromJson(Map<String, Object?> json) =>
      _$PeersDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PeersDataModelToJson(this);
}
