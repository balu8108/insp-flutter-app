import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/assignmentwidget/assignment_widget_screen.dart';
import 'package:inspflutterfrontend/attendancewidget/attendance_screen.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/library/library_screen.dart';
import 'package:inspflutterfrontend/librarywidget/library_widget_screen.dart';
import 'package:inspflutterfrontend/mycourses/my_courses_screen.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_screen.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

class StudentHomeScreen extends StatelessWidget {
  StudentHomeScreen({super.key});

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
              flex: 9,
              child: Column(
                children: [
                  MyCoursesWidget(
                    onViewDetailsClicked: onPressedMyCourse,
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(
                        flex: 7, // 70%
                        child: AttendanceScreen(),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 3, // 30%
                        child: AssignmentScreen(),
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
            Expanded(
              flex: 3,
              child: UpcomingClassesScreen.getScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
