import 'package:flutter/material.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/common/upcomingsession/upcoming_session.dart';
import 'package:insp/pages/teacher/dashboard/myupload/myupload_widget.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/pages/student/library/mainpage/library_screen.dart';
import 'package:insp/pages/common/courses/my_courses_screen.dart';
import 'package:insp/pages/common/courses/widget/mycourseswidget/my_courses_widget_screen.dart';
import 'package:insp/pages/teacher/dashboard/ratingandfeedback/rating_and_feedback.dart';
import 'package:insp/pages/teacher/dashboard/soloclasses/soloclasses_widget.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
    pushWithoutAnimation(context, MyCoursesScreen.getScreen(inspCardModel));
  }

  void onPressedLibrary(BuildContext context, INSPCardModel inspCardModel) {
    pushWithoutAnimation(context, LibraryScreen.getScreen(inspCardModel));
  }

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();

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
                  const UpcomingSession(),
                  const SizedBox(height: 16),
                  Soloclasses.getScreen(),
                  const SizedBox(height: 16),
                  MyUpload.getScreen(),
                  const SizedBox(height: 16),
                  RatingFeedback.getScreen(),
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 6, // 60%
                              child: Column(
                                children: [
                                  Soloclasses.getScreen(),
                                  const SizedBox(height: 16),
                                  MyUpload.getScreen(),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 4, // 40%
                              child: RatingFeedback.getScreen(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (isWebOrLandScape) const SizedBox(width: 17),
                  if (isWebOrLandScape)
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
