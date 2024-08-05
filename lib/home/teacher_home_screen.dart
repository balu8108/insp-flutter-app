import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
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
    bool isWebOrLandScape = context.isWebOrLandScape();
    // bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: isWebOrLandScape
          ? const EdgeInsets.all(20.0)
          : const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: !isWebOrLandScape
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyCoursesWidget(onViewDetailsClicked: onPressedMyCourse),
                  const SizedBox(height: 16),
                  const SoloclassesScreen(),
                  const SizedBox(height: 16),
                  const MyUploadScreen(),
                  const SizedBox(height: 16),
                  const RatingFeedbackScreen(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyCoursesWidget(
                            onViewDetailsClicked: onPressedMyCourse),
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
                  if (isWebOrLandScape)
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
