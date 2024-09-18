import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/pages/common/courses/widget/topicorlectureswidget/topic_or_lecture_widget_screen.dart';
import 'package:insp/pages/common/courses/my_courses_redux.dart';
import 'package:insp/pages/common/courses/widget/mycourseswidget/my_courses_widget_screen.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';

import '../../../base/base.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();

    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, showTopicsForCourse(context, inspCardModel));
    }

    dispatch(context, initialFetchTopics(context));

    return Container(
        padding: isWebOrLandScape
            ? const EdgeInsets.all(10.0)
            : const EdgeInsets.all(0.0),
        color: Colors.white,
        child: StoreConnector<MyCoursesAppState, MyCoursesAppState>(
          converter: (store) => store.state,
          builder: (context, MyCoursesAppState state) => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: !isWebOrLandScape
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyCoursesWidget(onViewDetailsClicked: onPressedMyCourse),
                      const SizedBox(height: 16),
                      TopicOrLectureWidget(
                          key: UniqueKey(),
                          heading: 'My Courss (${state.selectedItem.name})',
                          data: state.allLectures,
                          allTopicsForSelectedCourse:
                              state.allTopicsForSelectedCourse),
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
                            TopicOrLectureWidget(
                                key: UniqueKey(),
                                heading:
                                    'My Courses (${state.selectedItem.name})',
                                data: state.allLectures,
                                allTopicsForSelectedCourse:
                                    state.allTopicsForSelectedCourse),
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
