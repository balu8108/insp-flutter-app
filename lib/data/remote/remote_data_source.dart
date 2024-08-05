import 'package:dio/dio.dart';
import 'package:inspflutterfrontend/data/remote/models/assignment/all_assignment_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/assignment/latest_upload_assignment_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/library/all_topic_for_chapter_request_model.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_lectures_for_topic_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_subjects_request_model.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_subjects_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/ratingfeedback/latest_completed_class_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/soloclasses/all_solo_classes_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/soloclasses/latest_solo_classes_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';
import 'package:retrofit/dio.dart';

import 'models/library/all_topics_for_subject_request_model.dart';
import 'models/library/all_topics_for_subject_response_model.dart';
import 'models/login/login_request_model.dart';
import 'models/login/login_response_model.dart';
import 'models/mycourses/physics_course_topics_request_model.dart';
import 'models/mycourses/physics_course_topics_response_model.dart';
import 'models/upcomingclasses/all_lectures_for_upcoming_response_model.dart';
import 'network_service.dart';

abstract class RemoteDataSource {
  factory RemoteDataSource() = RemoteDataSourceImpl;

  Future<HttpResponse<LoginResponseModel>> deviceLogin(
      LoginRequestModel deviceInsightsRequestModel);

  Future<HttpResponse<AllSubjectsResponseModel>> getAllSubjects(
      AllSubjectsRequestModel allSubjectsRequestModel);

  Future<HttpResponse<AllTopicsForSubjectResponseModel>> getAllTopicsForSubject(
      AllTopicsForSubjectRequestModel allTopicsForSubjectRequestModel);

  Future<HttpResponse<PhysicsCourseTopicsResponseModel>>
      getAllTopicsForMyCourse(
          PhysicsCourseTopicsRequestModel allTopicsForMyCourseRequestModel);

  Future<HttpResponse<PhysicsCourseTopicsResponseModel>> getAllTopicsByChapter(
      AllTopicsForChapterRequestModel allTopicsForChapterRequestModel);

  Future<HttpResponse<PhysicsCourseTopicsResponseModel>> getAllTopics(
      PhysicsCourseTopicsRequestModel allTopicsForRequestModel);

  Future<HttpResponse<LatestSoloClassesResponseModel>> getLatestSoloClasses(
      String secretTokenHeader);

  Future<HttpResponse<LatestCompletedClassesResponseModel>>
      getLatestCompletedClasses(String secretTokenHeader);

  Future<HttpResponse<LatestUploadedAssignmentResponseModel>>
      getLatestAssignment(String secretTokenHeader);

  Future<HttpResponse<AllLecturesForUpcomingResponseModel>>
      getAllUpcomingClasses(String secretTokenHeader);

  Future<HttpResponse<AllSoloClassesResponseModel>> getAllSoloClasses(
      String secretTokenHeader);

  Future<HttpResponse<LectureDetailByRoomIdResponseModel>>
      getLecturesDetailByRoomId(String roomId, String secretTokenHeader);

  Future<HttpResponse<AllAssignmentResponseModel>> getAssigmentByTopicId(
      String topicId, String secretTokenHeader);

  Future<HttpResponse<AllLecturesForCourseResponseModel>>
      getAllLecturesForCourse(
          String classType, String classLevel, String secretTokenHeader);

  Future<HttpResponse<AllLecturesForTopicResponseModel>> getAllLectureByTopic(
      String topicId, String topicType, String secretTokenHeader);

  Future<HttpResponse<AllAssignmentResponseModel>> getAllAssignmentForTopic(
      String topicId, String secretTokenHeader);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final deviceNetworkService = NetworkService(Dio());

  @override
  Future<HttpResponse<LoginResponseModel>> deviceLogin(
      LoginRequestModel loginRequestModel) {
    return deviceNetworkService.deviceLogin(loginRequestModel);
  }

  @override
  Future<HttpResponse<AllSubjectsResponseModel>> getAllSubjects(
      AllSubjectsRequestModel allSubjectsRequestModel) {
    return deviceNetworkService.getAllSubjects(allSubjectsRequestModel);
  }

  @override
  Future<HttpResponse<AllTopicsForSubjectResponseModel>> getAllTopicsForSubject(
      AllTopicsForSubjectRequestModel allTopicsForSubjectRequestModel) {
    return deviceNetworkService
        .getAllTopicsForSubject(allTopicsForSubjectRequestModel);
  }

  @override
  Future<HttpResponse<PhysicsCourseTopicsResponseModel>> getAllTopicsByChapter(
      AllTopicsForChapterRequestModel allTopicsForChapterRequestModel) {
    return deviceNetworkService
        .getAllTopicsByChapter(allTopicsForChapterRequestModel);
  }

  @override
  Future<HttpResponse<PhysicsCourseTopicsResponseModel>> getAllTopics(
      PhysicsCourseTopicsRequestModel allTopicsForRequestModel) {
    return deviceNetworkService.getAllTopics(allTopicsForRequestModel);
  }

  @override
  Future<HttpResponse<PhysicsCourseTopicsResponseModel>>
      getAllTopicsForMyCourse(
          PhysicsCourseTopicsRequestModel allTopicsForMyCourseRequestModel) {
    return deviceNetworkService
        .getAllTopicsForMyCourse(allTopicsForMyCourseRequestModel);
  }

  @override
  Future<HttpResponse<LatestSoloClassesResponseModel>> getLatestSoloClasses(
      String secretTokenHeader) {
    return deviceNetworkService.getLatestSoloClasses(secretTokenHeader);
  }

  @override
  Future<HttpResponse<LatestCompletedClassesResponseModel>>
      getLatestCompletedClasses(String secretTokenHeader) {
    return deviceNetworkService.getLatestCompletedClasses(secretTokenHeader);
  }

  @override
  Future<HttpResponse<LatestUploadedAssignmentResponseModel>>
      getLatestAssignment(String secretTokenHeader) {
    return deviceNetworkService.getLatestAssignment(secretTokenHeader);
  }

  @override
  Future<HttpResponse<AllLecturesForUpcomingResponseModel>>
      getAllUpcomingClasses(String secretTokenHeader) {
    return deviceNetworkService.getAllUpcomingClasses(secretTokenHeader);
  }

  @override
  Future<HttpResponse<AllSoloClassesResponseModel>> getAllSoloClasses(
      String secretTokenHeader) {
    return deviceNetworkService.getAllSoloClasses(secretTokenHeader);
  }

  @override
  Future<HttpResponse<LectureDetailByRoomIdResponseModel>>
      getLecturesDetailByRoomId(String roomId, String secretTokenHeader) {
    return deviceNetworkService.getLecturesDetailByRoomId(
        roomId, secretTokenHeader);
  }

  @override
  Future<HttpResponse<AllAssignmentResponseModel>> getAssigmentByTopicId(
      String topicId, String secretTokenHeader) {
    return deviceNetworkService.getAssigmentByTopicId(
        topicId, secretTokenHeader);
  }

  @override
  Future<HttpResponse<AllLecturesForCourseResponseModel>>
      getAllLecturesForCourse(
          String classType, String classLevel, String secretTokenHeader) {
    return deviceNetworkService.getAllLecturesForCourse(
        classType, classLevel, secretTokenHeader);
  }

  @override
  Future<HttpResponse<AllLecturesForTopicResponseModel>> getAllLectureByTopic(
      String topicId, String topicType, String secretTokenHeader) {
    return deviceNetworkService.getAllLectureByTopic(
        topicId, topicType, secretTokenHeader);
  }

  @override
  Future<HttpResponse<AllAssignmentResponseModel>> getAllAssignmentForTopic(
      String topicId, String secretTokenHeader) {
    return deviceNetworkService.getAllAssignmentForTopic(
        topicId, secretTokenHeader);
  }
}
