import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/common/model/lecture_card_model.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:inspflutterfrontend/lecturedetail/lecture_detail_redux.dart';
import 'package:inspflutterfrontend/lecturedetail/lecture_detail_widget.dart';
import 'package:inspflutterfrontend/mycourses/my_courses_screen.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_screen.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

import '../base/base.dart';

class LectureDetailScreen extends StatelessWidget {
  const LectureDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, initialFetchLectureDetail(context));
    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyCoursesScreen.getScreen(inspCardModel)));
    }

    return Scaffold(
        appBar: MyAppBar(),
        body: StoreConnector<LectureDetailAppState, LectureDetailAppState>(
          converter: (store) => store.state,
          builder: (context, LectureDetailAppState state) => Container(
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
                            MyCoursesWidget(
                                onViewDetailsClicked: onPressedMyCourse),
                            const SizedBox(height: 16),
                            LectureDetailWidget(
                                lectureData: state.lectureData,
                                assignments: state.assignments,
                                question: state.question)
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

  static getScreen(LectureCardModel selectedItem) {
    return getBaseScreen<LectureDetailAppState, LectureDetailScreen>(
        lectureDetailReducer,
        LectureDetailAppState(selectedItem: selectedItem),
        const LectureDetailScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<LectureDetailAppState>(context, action);
  }
}
