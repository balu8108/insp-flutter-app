import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/card/model/lecture_card_model.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/lecture/lecturedetailpage/lecture_detail_redux.dart';
import 'package:inspflutterfrontend/pages/common/lecture/widget/lecture_detail_widget.dart';
import 'package:inspflutterfrontend/pages/common/courses/my_courses_screen.dart';
import 'package:inspflutterfrontend/pages/common/courses/widget/mycourseswidget/my_courses_widget_screen.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';

import '../../../../base/base.dart';

class LectureDetailScreen extends StatelessWidget {
  const LectureDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    dispatch(context, initialFetchLectureDetail(context));
    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyCoursesScreen.getScreen(inspCardModel)));
    }

    return Scaffold(
      appBar: Navbar(),
      body: StoreConnector<LectureDetailAppState, LectureDetailAppState>(
          converter: (store) => store.state,
          builder: (context, LectureDetailAppState state) => Container(
                padding: isWebOrLandScape
                    ? const EdgeInsets.all(10.0)
                    : const EdgeInsets.all(0.0),
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: isWebOrLandScape
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyCoursesWidget(
                                onViewDetailsClicked: onPressedMyCourse),
                            const SizedBox(height: 16),
                            LectureDetailWidget(
                                lectureData: state.lectureData,
                                assignments: state.assignments,
                                question: state.question)
                          ],
                        )
                      : Row(
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
