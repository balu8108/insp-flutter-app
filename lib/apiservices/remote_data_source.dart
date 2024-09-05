import 'package:dio/dio.dart';
import 'package:inspflutterfrontend/apiservices/models/assignment/all_assignment_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/assignment/delete_assignment_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/assignment/latest_upload_assignment_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/calendar/all_calendar_scheduled_data_model.dart';
import 'package:inspflutterfrontend/apiservices/models/calendar/timetable_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/feedback/all_student_feedback_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/feedback/all_student_feedback_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/feedback/create_student_feedback_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/feedback/create_student_feedback_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/generic/generic_open_file_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/library/all_topic_for_chapter_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/liveclass/liveclass_preview_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/login/device_login_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_topic_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_subjects_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_subjects_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/get_lecture_no_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/get_lecture_no_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/ratingfeedback/latest_completed_class_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/ratingfeedback/rating_feedback_rating_detail_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/soloclasses/all_solo_classes_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/soloclasses/latest_solo_classes_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/soloclasses/soloclass_topicwise_details_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/tpstream/video_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/tpstream/video_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';
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

  Future<HttpResponse<LoginResponseModel>> doesTokenValid(
      LoginRequestModel deviceInsightsRequestModel);

  Future<HttpResponse<LoginResponseModel>> deviceLogin(
      DeviceLoginRequestModel deviceInsightsRequestModel);

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

  Future<HttpResponse<SoloclassTopicwiseDetailsResponseModel>>
      getSoloClassTopicWiseDetails(String topicId, String secretTokenHeader);

  Future<HttpResponse<LatestCompletedClassesResponseModel>>
      getLatestCompletedClasses(String secretTokenHeader);

  Future<HttpResponse<LatestUploadedAssignmentResponseModel>>
      getLatestAssignment(String secretTokenHeader);

  Future<HttpResponse<AllLecturesForUpcomingResponseModel>>
      getAllUpcomingClasses(String secretTokenHeader);

  Future<HttpResponse<AllCalendarScheduledDataModel>> getAllCalendarData(
      String secretTokenHeader);

  Future<HttpResponse<AllSoloClassesResponseModel>> getAllSoloClasses(
      String secretTokenHeader);

  Future<HttpResponse<LectureDetailByRoomIdResponseModel>>
      getLecturesDetailByRoomId(String roomId, String secretTokenHeader);

  Future<HttpResponse<AllAssignmentResponseModel>> getAssigmentByTopicId(
      String topicId, String secretTokenHeader);

  Future<HttpResponse<RatingFeedbackRatingDetailResponseModel>>
      getTopicFeedbackRatingDetail(String topicId, String secretTokenHeader);

  Future<HttpResponse<AllLecturesForCourseResponseModel>>
      getAllLecturesForCourse(
          String classType, String classLevel, String secretTokenHeader);

  Future<HttpResponse<GetLectureNoResponseModel>> getLectureNumber(
      GetLectureNoRequestModel lectureNoRequestModel, String secretTokenHeader);

  Future<HttpResponse<AllLecturesForTopicResponseModel>> getAllLectureByTopic(
      String topicId, String topicType, String secretTokenHeader);

  Future<HttpResponse<AllAssignmentResponseModel>> getAllAssignmentForTopic(
      String topicId, String secretTokenHeader);

  Future<HttpResponse<DeleteAssignmentResponseModel>> deleteAssignment(
      int assignmentId, String secretTokenHeader);

  Future<HttpResponse<DeleteAssignmentResponseModel>> deleteStudentFeedback(
      int feedbackId, String secretTokenHeader);

  Future<HttpResponse<AllAssignmentResponseModel>> getRecentAssignment(
      String secretTokenHeader);

  Future<HttpResponse<AllStudentFeedbackResponseModel>> getAllStudentFeedback(
      AllStudentFeedbackRequestModel feedbackrequest, String secretTokenHeader);

  Future<HttpResponse<AllSoloClassesResponseModel>> getAllSoloClassForTopic(
      String topicId, String secretTokenHeader);

  Future<HttpResponse<GenericOpenFileResponseModel>> getDocumentUrl(
      String docId, String docType, String secretTokenHeader);

  Future<HttpResponse<CreateStudentFeedbackResponseModel>>
      createStudentFeedback(CreateStudentFeedbackRequestModel feedbackrequest,
          String secretTokenHeader);

  Future<HttpResponse<LiveClassPreviewResponseModel>> getRoomPreviewData(
      String roomId, String secretTokenHeader);

  Future<HttpResponse<VideoResponseModel>> getVideoPlayUrl(String videoId,
      VideoRequestModel videoRequestModel, String secretTokenHeader);

  Future<HttpResponse<TimeTableResponseDataModel>> getAllTimeTable(
      String secretTokenHeader);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final deviceNetworkService = NetworkService(Dio());

  @override
  Future<HttpResponse<LoginResponseModel>> doesTokenValid(
      LoginRequestModel loginRequestModel) {
    return deviceNetworkService.doesTokenValid(loginRequestModel);
  }

  @override
  Future<HttpResponse<LoginResponseModel>> deviceLogin(
      DeviceLoginRequestModel loginRequestModel) {
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
  Future<HttpResponse<RatingFeedbackRatingDetailResponseModel>>
      getTopicFeedbackRatingDetail(String topicId, String secretTokenHeader) {
    return deviceNetworkService.getTopicFeedbackRatingDetail(
        topicId, secretTokenHeader);
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

// for the calendar data

  @override
  Future<HttpResponse<AllCalendarScheduledDataModel>> getAllCalendarData(
      String secretTokenHeader) {
    return deviceNetworkService.getAllCalendarData(secretTokenHeader);
  }

  @override
  Future<HttpResponse<AllSoloClassesResponseModel>> getAllSoloClasses(
      String secretTokenHeader) {
    return deviceNetworkService.getAllSoloClasses(secretTokenHeader);
  }

  @override
  Future<HttpResponse<SoloclassTopicwiseDetailsResponseModel>>
      getSoloClassTopicWiseDetails(String topicId, String secretTokenHeader) {
    return deviceNetworkService.getSoloClassTopicWiseDetails(
        topicId, secretTokenHeader);
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

  @override
  Future<HttpResponse<DeleteAssignmentResponseModel>> deleteAssignment(
      int assignmentId, String secretTokenHeader) {
    return deviceNetworkService.deleteAssignment(
        assignmentId, secretTokenHeader);
  }

  @override
  Future<HttpResponse<GetLectureNoResponseModel>> getLectureNumber(
      GetLectureNoRequestModel lectureNoRequestModel,
      String secretTokenHeader) {
    return deviceNetworkService.getLectureNumber(
        lectureNoRequestModel, secretTokenHeader);
  }

  @override
  Future<HttpResponse<DeleteAssignmentResponseModel>> deleteStudentFeedback(
      int feedbackId, String secretTokenHeader) {
    return deviceNetworkService.deleteStudentFeedback(
        feedbackId, secretTokenHeader);
  }

  @override
  Future<HttpResponse<AllStudentFeedbackResponseModel>> getAllStudentFeedback(
      AllStudentFeedbackRequestModel feedbackrequest,
      String secretTokenHeader) {
    return deviceNetworkService.getAllStudentFeedback(
        feedbackrequest, secretTokenHeader);
  }

  @override
  Future<HttpResponse<AllAssignmentResponseModel>> getRecentAssignment(
      String secretTokenHeader) {
    return deviceNetworkService.getRecentAssignment(secretTokenHeader);
  }

  @override
  Future<HttpResponse<AllSoloClassesResponseModel>> getAllSoloClassForTopic(
      String topicId, String secretTokenHeader) {
    return deviceNetworkService.getAllSoloClassForTopic(
        topicId, secretTokenHeader);
  }

  @override
  Future<HttpResponse<GenericOpenFileResponseModel>> getDocumentUrl(
      String docId, String docType, String secretTokenHeader) {
    return deviceNetworkService.getDocumentUrl(
        docId, docType, secretTokenHeader);
  }

  @override
  Future<HttpResponse<CreateStudentFeedbackResponseModel>>
      createStudentFeedback(CreateStudentFeedbackRequestModel feedbackrequest,
          String secretTokenHeader) {
    return deviceNetworkService.createStudentFeedback(
        feedbackrequest, secretTokenHeader);
  }

  @override
  Future<HttpResponse<LiveClassPreviewResponseModel>> getRoomPreviewData(
      String roomId, String secretTokenHeader) {
    return deviceNetworkService.getRoomPreviewData(roomId, secretTokenHeader);
  }

  @override
  Future<HttpResponse<VideoResponseModel>> getVideoPlayUrl(String videoId,
      VideoRequestModel videoRequestModel, String secretTokenHeader) {
    return deviceNetworkService.getVideoPlayUrl(
        videoId, videoRequestModel, secretTokenHeader);
  }

  @override
  Future<HttpResponse<TimeTableResponseDataModel>> getAllTimeTable(
      String secretTokenHeader) {
    return deviceNetworkService.getAllTimeTable(secretTokenHeader);
  }
}
