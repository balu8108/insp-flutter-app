import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/lectureswidget/topic_or_lecture_widget_screen.dart';
import 'package:inspflutterfrontend/mycourses/my_courses_redux.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_screen.dart';

import '../base/base.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, showTopicsForCourse(context, inspCardModel));
    }

    void onSearchQueryEntered(String text) {
      dispatch(context, filterWithQueryText(context, text));
    }

    dispatch(context, initialFetchTopics(context));

    void callCourseApi() {
      dispatch(context, getMyCourses(context));
    }

    return Scaffold(
        body: StoreConnector<MyCoursesAppState, MyCoursesAppState>(
      converter: (store) => store.state,
      builder: (context, MyCoursesAppState state) => Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                MyCoursesWidget(
                    onViewDetailsClicked: onPressedMyCourse,
                    callCourseApi: callCourseApi),
                const SizedBox(
                  height: 16,
                ),
                TopicOrLectureWidget(
                    key: UniqueKey(),
                    onViewDetailsClicked: (BuildContext, INSPCardModel) {},
                    heading: state.selectedItem.name,
                    data: ""),
              ],
            )),
      ),
    ));
  }

  static getScreen(INSPCardModel selectedItem) {
    return getBaseScreen<MyCoursesAppState, MyCoursesScreen>(
        myCoursesStateReducer,
        MyCoursesAppState(selectedItem: selectedItem),
        const MyCoursesScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<MyCoursesAppState>(context, action);
  }
}
