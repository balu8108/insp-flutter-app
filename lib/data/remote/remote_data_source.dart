import 'package:dio/dio.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_subjects_request_model.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_subjects_response_model.dart';
import 'package:retrofit/dio.dart';

import 'models/library/all_topics_for_subject_request_model.dart';
import 'models/library/all_topics_for_subject_response_model.dart';
import 'models/login/login_request_model.dart';
import 'models/login/login_response_model.dart';
import 'models/mycourses/physics_course_topics_request_model.dart';
import 'models/mycourses/physics_course_topics_response_model.dart';
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

  Future<HttpResponse<AllLecturesForCourseResponseModel>>
      getAllLecturesForCourse(
          String classType, String classLevel, String secretTokenHeader);
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
  Future<HttpResponse<PhysicsCourseTopicsResponseModel>>
      getAllTopicsForMyCourse(
          PhysicsCourseTopicsRequestModel allTopicsForMyCourseRequestModel) {
    return deviceNetworkService
        .getAllTopicsForMyCourse(allTopicsForMyCourseRequestModel);
  }

  @override
  Future<HttpResponse<AllLecturesForCourseResponseModel>>
      getAllLecturesForCourse(
          String classType, String classLevel, String secretTokenHeader) {
    return deviceNetworkService.getAllLecturesForCourse(
        classType, classLevel, secretTokenHeader);
  }
}
