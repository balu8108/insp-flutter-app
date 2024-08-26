import 'package:freezed_annotation/freezed_annotation.dart';

part 'polldata_model.g.dart';

@JsonSerializable()
class PollDataModel {
  const PollDataModel(
      {this.noOfOptions = 0,
      this.questionNo = 0,
      this.time = 0,
      this.correctAnswers = const [],
      this.questionId = '',
      this.type = ''});

  final List<String> correctAnswers;
  final int noOfOptions, questionNo, time;
  final String questionId, type;

  factory PollDataModel.fromJson(Map<String, Object?> json) =>
      _$PollDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PollDataModelToJson(this);
}
