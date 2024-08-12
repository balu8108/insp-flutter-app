import 'package:dio/dio.dart';
import 'package:inspflutterfrontend/apiservices/models/assignment/all_assignment_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/assignment/latest_upload_assignment_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/library/all_topic_for_chapter_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/library/all_topics_for_subject_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/library/all_topics_for_subject_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_topic_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_subjects_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_subjects_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/physics_course_topics_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/physics_course_topics_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/ratingfeedback/latest_completed_class_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/ratingfeedback/rating_feedback_rating_detail_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/soloclasses/all_solo_classes_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/soloclasses/latest_solo_classes_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/soloclasses/soloclass_topicwise_details_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import 'models/login/login_request_model.dart';
import 'models/login/login_response_model.dart';
import 'models/mycourses/all_lectures_for_course_response_model.dart';
import 'models/upcomingclasses/all_lectures_for_upcoming_response_model.dart';

part 'network_service.g.dart';

@RestApi(baseUrl: 'https://dev.insp.1labventures.in/')
abstract class NetworkService {
  factory NetworkService(Dio dio, {String baseUrl}) = _NetworkService;

  @POST('https://inspedu.in/webservices/apis/login_app')
  Future<HttpResponse<LoginResponseModel>> deviceLogin(
    @Body() LoginRequestModel loginRequestModel,
  );

  @POST('https://inspedu.in/webservices/apis/subjects')
  Future<HttpResponse<AllSubjectsResponseModel>> getAllSubjects(
    @Body() AllSubjectsRequestModel allSubjectsRequestModel,
  );

  @POST('https://inspedu.in/webservices/apis/subject_wise_topics')
  Future<HttpResponse<AllTopicsForSubjectResponseModel>> getAllTopicsForSubject(
    @Body() AllTopicsForSubjectRequestModel allTopicsForSubjectRequestModel,
  );

  @POST('https://inspedu.in/webservices/apis/chapters')
  Future<HttpResponse<PhysicsCourseTopicsResponseModel>>
      getAllTopicsForMyCourse(
    @Body() PhysicsCourseTopicsRequestModel allTopicsForMyCourseRequestModel,
  );

  @POST('https://inspedu.in/webservices/apis/topics/')
  Future<HttpResponse<PhysicsCourseTopicsResponseModel>> getAllTopicsByChapter(
    @Body() AllTopicsForChapterRequestModel allTopicsForChapterRequestModel,
  );

  @POST('https://inspedu.in/webservices/apis/all_topics')
  Future<HttpResponse<PhysicsCourseTopicsResponseModel>> getAllTopics(
    @Body() PhysicsCourseTopicsRequestModel allTopicsForRequestModel,
  );

  @GET('/lecture/get-lecture-by-topic-name/{topicId}/{topicType}')
  Future<HttpResponse<AllLecturesForTopicResponseModel>> getAllLectureByTopic(
      @Path() String topicId,
      @Path() String topicType,
      @Header('Authorization') String secretTokenHeader);

  @GET('/solo-lecture/latest-room')
  Future<HttpResponse<LatestSoloClassesResponseModel>> getLatestSoloClasses(
      @Header('Authorization') String secretTokenHeader);

  @GET('/generic/latest-completed-live-classroom')
  Future<HttpResponse<LatestCompletedClassesResponseModel>>
      getLatestCompletedClasses(
          @Header('Authorization') String secretTokenHeader);

  @GET('/generic/topic-feedback-rating-details/{topicId}')
  Future<HttpResponse<RatingFeedbackRatingDetailResponseModel>>
      getTopicFeedbackRatingDetail(@Path() String topicId,
          @Header('Authorization') String secretTokenHeader);

  @GET('/assignment/latest-assignment')
  Future<HttpResponse<LatestUploadedAssignmentResponseModel>>
      getLatestAssignment(@Header('Authorization') String secretTokenHeader);

  @GET('/solo-lecture/get-all-soloclassrooms')
  Future<HttpResponse<AllSoloClassesResponseModel>> getAllSoloClasses(
      @Header('Authorization') String secretTokenHeader);

  @GET('/solo-lecture/get-topic-details/{topicId}')
  Future<HttpResponse<SoloclassTopicwiseDetailsResponseModel>>
      getSoloClassTopicWiseDetails(@Path() String topicId,
          @Header('Authorization') String secretTokenHeader);

  @GET('/schedule-live-class/get-all')
  Future<HttpResponse<AllLecturesForUpcomingResponseModel>>
      getAllUpcomingClasses(@Header('Authorization') String secretTokenHeader);

  @GET('/lecture/get-lecture-by-id/{roomId}')
  Future<HttpResponse<LectureDetailByRoomIdResponseModel>>
      getLecturesDetailByRoomId(@Path() String roomId,
          @Header('Authorization') String secretTokenHeader);

  @GET('/assignment/get-all-assignments-topic-id')
  Future<HttpResponse<AllAssignmentResponseModel>> getAssigmentByTopicId(
      @Query('topicId') String topicId,
      @Header('Authorization') String secretTokenHeader);

  @GET('/lecture/get-all-lecture/{classType}/{classLevel}')
  Future<HttpResponse<AllLecturesForCourseResponseModel>>
      getAllLecturesForCourse(
          @Path() String classType,
          @Path() String classLevel,
          @Header('Authorization') String secretTokenHeader);

  @GET('/assignment/get-assignment-by-topic-id/{topicId}')
  Future<HttpResponse<AllAssignmentResponseModel>> getAllAssignmentForTopic(
      @Path() String topicId,
      @Header('Authorization') String secretTokenHeader);
}
