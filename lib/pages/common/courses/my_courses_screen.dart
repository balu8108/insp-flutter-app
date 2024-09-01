import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/courses/widget/topicorlectureswidget/topic_or_lecture_widget_screen.dart';
import 'package:inspflutterfrontend/pages/common/courses/my_courses_redux.dart';
import 'package:inspflutterfrontend/pages/common/courses/widget/mycourseswidget/my_courses_widget_screen.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';

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

    return Scaffold(
      appBar: Navbar(),
      body: StoreConnector<MyCoursesAppState, MyCoursesAppState>(
          converter: (store) => store.state,
          builder: (context, MyCoursesAppState state) => Container(
                padding: isWebOrLandScape
                    ? const EdgeInsets.all(10.0)
                    : const EdgeInsets.all(0.0),
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: !isWebOrLandScape
                      ? Column(
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
                              Expanded(
                                flex: 3,
                                child: const UpcomingClassesScreen(),
                              ),
                          ],
                        ),
                ),
              )),
    );
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
