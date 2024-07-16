import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/assignmentwidget/assignment_widget_screen.dart';
import 'package:inspflutterfrontend/attendancewidget/attendance_screen.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/library/library_screen.dart';
import 'package:inspflutterfrontend/librarywidget/library_widget_screen.dart';
import 'package:inspflutterfrontend/mycourses/my_courses_screen.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_screen.dart';
import 'package:inspflutterfrontend/rating_and_feedback/rating_and_feedback_widget_screen.dart';
import 'package:inspflutterfrontend/soloclasses/soloclasses_widget_screen.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

class TeacherHomeScreen extends StatelessWidget {
  TeacherHomeScreen({super.key, required this.callCourseApi});

  final void Function() callCourseApi;

  void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyCoursesScreen.getScreen(inspCardModel)));
  }

  void onPressedLibrary(BuildContext context, INSPCardModel inspCardModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LibraryScreen.getScreen(inspCardModel)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  MyCoursesWidget(
                    onViewDetailsClicked: onPressedMyCourse,
                    callCourseApi: callCourseApi,
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(
                        flex: 6, // 60%
                        child: SoloclassesScreen(),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 4, // 40%
                        child: RatingFeedbackScreen(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LibraryWidget(
                    onViewDetailsClicked: onPressedLibrary,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 17),
            const Expanded(
              flex: 3,
              child: UpcomingClassesScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
