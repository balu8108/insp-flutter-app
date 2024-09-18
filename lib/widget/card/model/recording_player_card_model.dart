import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:insp/apiservices/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';

part 'recording_player_card_model.g.dart';

@JsonSerializable()
class RecordingPlayerCard {
  const RecordingPlayerCard(this.topicName, this.mentorName, this.description,
      this.liveClassRoomFiles, this.liveClassRoomRecordings, this.agenda);

  @override
  final String topicName, mentorName, description, agenda;
  @JsonKey(name: 'LiveClassRoomFiles')
  final List<LiveClassRoomFile> liveClassRoomFiles;
  @JsonKey(name: 'LiveClassRoomRecordings')
  final List<LiveClassRoomRecordings> liveClassRoomRecordings;

  factory RecordingPlayerCard.fromJson(Map<String, Object?> json) =>
      _$RecordingPlayerCardFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecordingPlayerCardToJson(this);
}
