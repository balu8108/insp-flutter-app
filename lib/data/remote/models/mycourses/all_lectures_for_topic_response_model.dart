import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_lectures_for_course_response_model.dart';

part 'all_lectures_for_topic_response_model.g.dart';

@JsonSerializable()
class AllLecturesForTopicResponseModel {
  const AllLecturesForTopicResponseModel(
      [this.message = '', this.data = const []]);

  final String message;
  final List<AllLecturesForTopicResponseModelData> data;

  factory AllLecturesForTopicResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$AllLecturesForTopicResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AllLecturesForTopicResponseModelToJson(this);
}

@JsonSerializable()
class AllLecturesForTopicResponseModelData {
  const AllLecturesForTopicResponseModelData(
      [this.id = 0,
      this.roomId = '',
      this.scheduledDate = '',
      this.scheduledStartTime = '',
      this.scheduledEndTime = '',
      this.mentorId = '',
      this.mentorName = '',
      this.mentorEmail = '',
      this.mentorMobile = '',
      this.muteAllStudents = false,
      this.blockStudentsCamera = false,
      this.subjectId = '',
      this.subjectName = '',
      this.classStatus = '',
      this.classType = '',
      this.classLevel = '',
      this.createdAt = '',
      this.updatedAt = '',
      this.liveClassRoomDetail = const LiveClassRoomDetail()]);

  final int id;
  final String roomId,
      scheduledDate,
      scheduledStartTime,
      scheduledEndTime,
      mentorId,
      mentorName,
      mentorEmail,
      mentorMobile;
  final bool muteAllStudents, blockStudentsCamera;
  final String subjectId,
      subjectName,
      classStatus,
      classType,
      classLevel,
      createdAt,
      updatedAt;
  @JsonKey(name: 'LiveClassRoomDetail')
  final LiveClassRoomDetail liveClassRoomDetail;

  factory AllLecturesForTopicResponseModelData.fromJson(
          Map<String, Object?> json) =>
      _$AllLecturesForTopicResponseModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AllLecturesForTopicResponseModelDataToJson(this);
}
