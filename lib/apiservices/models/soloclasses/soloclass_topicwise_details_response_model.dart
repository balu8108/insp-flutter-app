import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:insp/apiservices/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';

part 'soloclass_topicwise_details_response_model.g.dart';

@JsonSerializable()
class SoloclassTopicwiseDetailsResponseModel {
  const SoloclassTopicwiseDetailsResponseModel(
      {this.transformedData = const TransformedModelData(),
      this.totalLectures = 0});

  final int totalLectures;
  final TransformedModelData transformedData;

  factory SoloclassTopicwiseDetailsResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$SoloclassTopicwiseDetailsResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$SoloclassTopicwiseDetailsResponseModelToJson(this);
}

@JsonSerializable()
class TransformedModelData {
  const TransformedModelData(
      [this.subjectId = '',
      this.topicId = '',
      this.topic = '',
      this.soloClassRoomRecordings = const [],
      this.soloClassRoomFiles = const []]);

  final String subjectId, topicId, topic;

  @JsonKey(name: 'SoloClassRoomRecordings')
  final List<SoloClassRoomRecordings> soloClassRoomRecordings;

  @JsonKey(name: 'SoloClassRoomFiles')
  final List<LiveClassRoomFile> soloClassRoomFiles;

  factory TransformedModelData.fromJson(Map<String, Object?> json) =>
      _$TransformedModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TransformedModelDataToJson(this);
}

@JsonSerializable()
class SoloClassRoomRecordings {
  const SoloClassRoomRecordings(
      [this.id = 0,
      this.key = '',
      this.soloClassRoomId = 0,
      this.tpStreamId = '',
      this.rtmpUrl = '',
      this.streamKey = '',
      this.status = '',
      this.createdAt = '',
      this.updatedAt = '']);

  final int id, soloClassRoomId;
  final String key, tpStreamId, status;
  final String createdAt, updatedAt;
  @JsonKey(name: 'rtmp_url')
  final String rtmpUrl;
  @JsonKey(name: 'stream_key')
  final String streamKey;

  factory SoloClassRoomRecordings.fromJson(Map<String, Object?> json) =>
      _$SoloClassRoomRecordingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SoloClassRoomRecordingsToJson(this);
}
