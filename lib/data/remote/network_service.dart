import 'package:dio/dio.dart';
import 'package:inspflutterfrontend/data/remote/models/assignment/latest_upload_assignment_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/library/all_topics_for_subject_request_model.dart';
import 'package:inspflutterfrontend/data/remote/models/library/all_topics_for_subject_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_subjects_request_model.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_subjects_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/physics_course_topics_request_model.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/physics_course_topics_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/ratingfeedback/latest_completed_class_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/soloclasses/latest_solo_classes_response_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import 'models/login/login_request_model.dart';
import 'models/login/login_response_model.dart';
import 'models/mycourses/all_lectures_for_course_response_model.dart';
import 'models/upcomingclasses/all_lectures_for_upcoming_response_model.dart';

part 'network_service.g.dart';

@RestApi(baseUrl: 'https://dev.insp.1labventures.in')
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

  @GET('/solo-lecture/latest-room')
  Future<HttpResponse<LatestSoloClassesResponseModel>> getLatestSoloClasses(
      @Header('Authorization') String secretTokenHeader);

  @GET('/generic/latest-completed-live-classroom')
  Future<HttpResponse<LatestCompletedClassesResponseModel>>
      getLatestCompletedClasses(
          @Header('Authorization') String secretTokenHeader);

  @GET('/assignment/latest-assignment')
  Future<HttpResponse<LatestUploadedAssignmentResponseModel>>
      getLatestAssignment(@Header('Authorization') String secretTokenHeader);

  @GET('/schedule-live-class/get-all')
  Future<HttpResponse<AllLecturesForUpcomingResponseModel>>
      getAllUpcomingClasses(@Header('Authorization') String secretTokenHeader);

  @GET('/lecture/get-all-lecture/{classType}/{classLevel}')
  Future<HttpResponse<AllLecturesForCourseResponseModel>>
      getAllLecturesForCourse(
          @Path() String classType,
          @Path() String classLevel,
          @Header('Authorization') String secretTokenHeader);
}
