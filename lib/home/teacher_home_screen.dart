import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/library/library_screen.dart';
import 'package:inspflutterfrontend/mycourses/my_courses_screen.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_screen.dart';
import 'package:inspflutterfrontend/myuploads/myupload_widget_screen.dart';
import 'package:inspflutterfrontend/rating_and_feedback/rating_and_feedback_screen.dart';
import 'package:inspflutterfrontend/soloclasses/soloclasses_widget_screen.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

class TeacherHomeScreen extends StatelessWidget {
  TeacherHomeScreen({super.key});

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
                  MyCoursesWidget(onViewDetailsClicked: onPressedMyCourse),
                  const SizedBox(height: 16),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6, // 60%
                        child: Column(
                          children: [
                            SoloclassesScreen(),
                            SizedBox(height: 16),
                            MyUploadScreen(),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 4, // 40%
                        child: RatingFeedbackScreen(),
                      ),
                    ],
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
