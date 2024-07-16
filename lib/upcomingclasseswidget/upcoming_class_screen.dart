import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/insp_upcoming_class_card.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/data/hardcoded/upcoming_classes.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_redux.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_widget_redux.dart';

import '../data/hardcoded/mycourses_subjects.dart';
import '../data/hardcoded/secret_key.dart';
import '../data/remote/models/mycourses/all_subjects_request_model.dart';
import '../data/remote/remote_data_source.dart';

class UpcomingClassesScreen extends StatefulWidget {
  const UpcomingClassesScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return MyCoursesWidgetState();
  }
}

class MyCoursesWidgetState extends State {
  UpcomingWidgetAppState upcomingWidgetAppState = const UpcomingWidgetAppState(
      ongoing: [], today: [], week: [], completed: []);

  MyCoursesWidgetState();

  void updateState(UpcomingWidgetAppState upcomingWidgetAppState) {
    setState(() {
      this.upcomingWidgetAppState = upcomingWidgetAppState;
    });
  }

  // call an API of get all subjects
  void getAllLecture() async {
    final remoteDataSource = RemoteDataSource();
    const token = 'Token eda273533eb416ca0316d537a60e9a23';
    final allLecture = await remoteDataSource.getAllUpcomingClasses(token);
    if (allLecture.data.data is Object) {
      var allSubjectsResults = allLecture.data.data;

      final inspLectureCardModels = allSubjectsResults;
      updateState(upcomingWidgetAppState.copyWith(
          ongoing: inspLectureCardModels.ongoing,
          today: inspLectureCardModels.today,
          week: inspLectureCardModels.week,
          completed: inspLectureCardModels.completed));
    }
  }

  @override
  void initState() {
    super.initState();
    getAllLecture();
  }



  List<AllLecturesForCourseResponseModelData> getUpcomingData(label) {
    if (label == 'Ongoing') {
      return upcomingWidgetAppState.ongoing;
    } else if (label == 'Today') {
      return upcomingWidgetAppState.today;
    } else if (label == 'Week') {
      return upcomingWidgetAppState.week;
    } else {
      return upcomingWidgetAppState.completed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: SizedBox(
        height: 700,
        child: classCategories.isNotEmpty
            ? Scrollbar(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: classCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        INSPHeading(classCategories[index].label),
                        ScheduleClassBox(
                            type: classCategories[index].label,
                            upcomingData:
                                getUpcomingData(classCategories[index].category)),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 17,
                    );
                  },
                ),
              )
            : const Center(child: Text('No items')),
      ),
    );
  }
}
