// For student homepage (for the latest assignment)---harshit
import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/pages/common/courses/widget/mycourseswidget/my_courses_widget_redux.dart';

import '../../../../data/hardcoded/mycourses_subjects.dart';

class AssignmentWidget extends StatefulWidget {
  const AssignmentWidget({super.key});
  @override
  State<StatefulWidget> createState() {
    return MyCoursesWidgetState();
  }
}

class MyCoursesWidgetState extends State {
  MyCoursesWidgetAppState myCoursesWidgetAppState =
      const MyCoursesWidgetAppState();

  MyCoursesWidgetState();

  void updateState(MyCoursesWidgetAppState myCoursesWidgetAppState) {
    setState(() {
      this.myCoursesWidgetAppState = myCoursesWidgetAppState;
    });
  }

  @override
  void initState() {
    super.initState();
    // callCourseApi();
    updateState(myCoursesWidgetAppState.copyWith(
        myCoursesInspCardModels: myCoursesData));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(children: [
        INSPHeading('Assignment'),
        const SizedBox(
          height: 17,
        ),
        const Center(child: Text('No items')),
      ]),
    );
  }
}
