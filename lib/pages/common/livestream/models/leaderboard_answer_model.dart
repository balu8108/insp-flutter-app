import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_answer_model.g.dart';

@JsonSerializable()
class LeaderBoardAnswerModel {
  const LeaderBoardAnswerModel({this.key = '', this.value = 0});
  final int value;
  final String key;

  factory LeaderBoardAnswerModel.fromJson(Map<String, Object?> json) =>
      _$LeaderBoardAnswerModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LeaderBoardAnswerModelToJson(this);
}
