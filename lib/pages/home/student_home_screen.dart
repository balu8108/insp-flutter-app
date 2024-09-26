import 'package:flutter/material.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/common/upcomingsession/upcoming_session.dart';
import 'package:insp/pages/student/dashboard/assignment/assignment_widget.dart';
import 'package:insp/pages/student/dashboard/attendance/attendance_widget.dart';
import 'package:insp/pages/student/library/widget/library_subject.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/pages/student/library/mainpage/library_screen.dart';
import 'package:insp/pages/common/courses/my_courses_screen.dart';
import 'package:insp/pages/common/courses/widget/mycourseswidget/my_courses_widget_screen.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

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
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 800) {
              // Mobile Layout (Column)
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCoursesWidget(
                      onViewDetailsClicked: onPressedMyCourse,
                    ),
                    const SizedBox(height: 16),
                    const UpcomingSession(),
                    const SizedBox(height: 16),
                    const AttendanceWidget(),
                    const SizedBox(height: 16),
                    AssignmentWidget.getScreen(),
                    const SizedBox(height: 16),
                    LibrarySubject(
                      onViewDetailsClicked: onPressedLibrary,
                    ),
                    const SizedBox(height: 16),
                    if (isWebOrLandScape) const UpcomingClassesScreen(),
                  ],
                ),
              );
            } else {
              // Desktop Layout (Row as per original)
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        children: [
                          MyCoursesWidget(
                            onViewDetailsClicked: onPressedMyCourse,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Expanded(
                                flex: 7, // 70%
                                child: AttendanceWidget(),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 3, // 30%
                                child: AssignmentWidget.getScreen(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          LibrarySubject(
                            onViewDetailsClicked: onPressedLibrary,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 17),
                    if (isWebOrLandScape)
                      const Expanded(
                        flex: 3,
                        child: UpcomingClassesScreen(),
                      ),
                  ],
                ),
              );
            }
          },
        ));
  }
}
