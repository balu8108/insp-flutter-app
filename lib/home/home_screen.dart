import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/assignmentwidget/assignment_widget_screen.dart';
import 'package:inspflutterfrontend/attendancewidget/attendance_screen.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/library/library_screen.dart';
import 'package:inspflutterfrontend/librarywidget/library_widget_screen.dart';
import 'package:inspflutterfrontend/mycourses/my_courses_screen.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_screen.dart';
import 'package:inspflutterfrontend/mycourses/my_courses_redux.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    void callCourseApi() {
      dispatch(context, getMyCourses(context));
    }

    return Scaffold(
        body: StoreConnector<MyCoursesAppState, MyCoursesAppState>(
            converter: (store) => store.state,
            builder: (context, MyCoursesAppState state) => Padding(
                padding: const EdgeInsets.all(40.0),
                // color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(children: [
                  Expanded(
                   flex: 7,
                    child:
                    Column(
                      children: [
                        MyCoursesWidget(
                            onViewDetailsClicked: onPressedMyCourse,
                            callCourseApi: callCourseApi),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 7, // 70%
                              child: AssignmentScreen(),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              flex: 3, // 30%
                              child: AttendanceScreen(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        LibraryWidget(onViewDetailsClicked: onPressedLibrary),
                      ],
                    )),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded( flex: 3, child: UpcomingClassesScreen())
                  ]),
                ))));
  }

  static getScreen(INSPCardModel selectedItem) {
    return getBaseScreen<MyCoursesAppState, HomeScreen>(myCoursesStateReducer,
        MyCoursesAppState(selectedItem: selectedItem), const HomeScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<MyCoursesAppState>(context, action);
  }
}
