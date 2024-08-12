import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/alltopicswidget/all_topics_widget.dart';
import 'package:inspflutterfrontend/pages/student/assignment/widget/assignment_course_widgets.dart';
import 'package:inspflutterfrontend/pages/student/assignment/mainpage/assignment_screen_redux.dart';
import 'package:inspflutterfrontend/pages/student/assignment/assignmenttopic/assignment_topic_screen.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/courses/my_courses_redux.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';
import '../../../../base/base.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, showSelectedItem(context, inspCardModel));
    }

    void callCourseApi() {
      dispatch(context, getMyCourses(context));
    }

    void onPressedTopic(BuildContext context, INSPCardModel selectedTopic) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AssignmentTopicScreen.getScreen(selectedTopic)),
      );
    }

    return Scaffold(
        appBar: Navbar(),
        body: StoreConnector<AssignmentScreenAppState,
                AssignmentScreenAppState>(
            converter: (store) => store.state,
            builder: (context, AssignmentScreenAppState state) => Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 9,
                                child: Column(
                                  children: [
                                    AssignmentCourseWidgets(
                                      onViewDetailsClicked: onPressedMyCourse,
                                      callCourseApi: callCourseApi,
                                    ),
                                    const SizedBox(height: 16),
                                    AllTopicWidget.getScreen(
                                        heading: state.selectedItem.name,
                                        onPressedViewDetails: onPressedTopic)
                                  ],
                                ),
                              ),
                              const SizedBox(width: 17),
                              Expanded(
                                flex: 3,
                                child: UpcomingClassesScreen.getScreen(),
                              ),
                            ]))))));
  }

  static getScreen(INSPCardModel selectedItem) {
    return getBaseScreen<AssignmentScreenAppState, AssignmentScreen>(
        assignmentCoursesStateReducer,
        AssignmentScreenAppState(selectedItem: selectedItem),
        const AssignmentScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<AssignmentScreenAppState>(context, action);
  }
}
