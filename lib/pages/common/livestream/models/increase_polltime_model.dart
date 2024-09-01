import 'package:freezed_annotation/freezed_annotation.dart';

part 'increase_polltime_model.g.dart';

@JsonSerializable()
class IncreasePollTimeModel {
  const IncreasePollTimeModel({this.questionId = '', this.timeIncreaseBy = 0});

  final String questionId;
  final int timeIncreaseBy;

  factory IncreasePollTimeModel.fromJson(Map<String, Object?> json) =>
      _$IncreasePollTimeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$IncreasePollTimeModelToJson(this);
}
