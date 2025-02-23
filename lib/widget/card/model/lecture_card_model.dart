import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';

part 'lecture_card_model.g.dart';

@JsonSerializable()
class LectureCardModel extends INSPCardModel {
  const LectureCardModel(this.id, this.roomId, this.name, this.status,
      this.description, this.topicName, this.scheduledDate, this.classLevel)
      : super(id, name, status, description);

  @override
  @override
  @override
  @override
  final String id,
      roomId,
      name,
      status,
      description,
      topicName,
      scheduledDate,
      classLevel;

  factory LectureCardModel.fromJson(Map<String, Object?> json) =>
      _$LectureCardModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LectureCardModelToJson(this);
}
