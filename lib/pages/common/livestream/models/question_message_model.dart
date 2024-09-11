import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/chat_message_model.dart';

part 'question_message_model.g.dart';

@JsonSerializable()
class QuestionMessageModel {
  const QuestionMessageModel(
      {this.questionMsg = '',
      this.peerDetails = const PeerDetail(id: '', name: '')});

  final String questionMsg;
  final PeerDetail peerDetails;

  factory QuestionMessageModel.fromJson(Map<String, Object?> json) =>
      _$QuestionMessageModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QuestionMessageModelToJson(this);
}
