import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:inspflutterfrontend/lectureswidget/topic_or_lecture_widget_screen.dart';
import 'package:inspflutterfrontend/mycourses/my_courses_redux.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_screen.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

import '../base/base.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      
      dispatch(context, showTopicsForCourse(context, inspCardModel));
    }

    dispatch(context, initialFetchTopics(context));

    return Scaffold(
        appBar: MyAppBar(),
        body: StoreConnector<MyCoursesAppState, MyCoursesAppState>(
          converter: (store) => store.state,
          builder: (context, MyCoursesAppState state) => Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyCoursesWidget(
                                onViewDetailsClicked: onPressedMyCourse),
                            const SizedBox(height: 16),
                            TopicOrLectureWidget(
                                key: UniqueKey(),
                                heading: state.selectedItem.name,
                                data: state.allLectures,
                                allTopicsForSelectedCourse:
                                    state.allTopicsForSelectedCourse),
                          ],
                        ),
                      ),
                      const SizedBox(width: 17),
                      Expanded(
                        flex: 3,
                        child: UpcomingClassesScreen.getScreen(),
                      ),
                    ],
                  ),
                ),
              )),
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
