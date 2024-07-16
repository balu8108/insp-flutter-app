import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_redux.dart';

import '../data/hardcoded/mycourses_subjects.dart';

class MyUploadScreen extends StatefulWidget {
  const MyUploadScreen({super.key});
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            INSPHeading('My Uploads'),
            const Text("+ Add Assignment",
                style:
                    TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis)),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        const Center(child: Text('No items')),
      ]),
    );
  }
}
