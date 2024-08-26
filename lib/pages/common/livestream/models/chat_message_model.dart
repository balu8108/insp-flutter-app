import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel {
  const ChatMessageModel(
      {this.msg = '', this.peerDetails = const PeerDetail(id: '', name: '')});

  final String msg;
  final PeerDetail peerDetails;

  factory ChatMessageModel.fromJson(Map<String, Object?> json) =>
      _$ChatMessageModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);
}

@JsonSerializable()
class PeerDetail {
  const PeerDetail({
    this.id = '',
    this.name = '',
  });
  final String id, name;

  factory PeerDetail.fromJson(Map<String, Object?> json) =>
      _$PeerDetailFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PeerDetailToJson(this);
}
