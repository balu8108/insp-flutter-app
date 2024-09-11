import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/widget/card/model/lecture_card_model.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/lecture/lecturedetailpage/lecture_detail_redux.dart';
import 'package:inspflutterfrontend/pages/common/lecture/widget/lecture_detail_widget.dart';
import 'package:inspflutterfrontend/pages/student/library/widget/library_allLecture.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';

import '../../../../base/base.dart';

class LibraryLectureDetailsScreen extends StatelessWidget {
  const LibraryLectureDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, initialFetchLectureDetail(context));

    return Scaffold(
        appBar: Navbar(),
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
                            LibraryAlllectureWidget(
                              heading: state.lectureData.liveClassRoom
                                  .liveClassRoomDetail.topicName,
                              lectureDetailsForLibrary:
                                  state.allLectureDetailsCardModel,
                            ),
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
                        child: const UpcomingClassesScreen(),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }

  static getScreen(LectureCardModel selectedItem,
      List<LectureCardModel> allLectureDetailsCardModel) {
    return getBaseScreen<LectureDetailAppState, LibraryLectureDetailsScreen>(
        lectureDetailReducer,
        LectureDetailAppState(
            selectedItem: selectedItem,
            allLectureDetailsCardModel: allLectureDetailsCardModel),
        const LibraryLectureDetailsScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<LectureDetailAppState>(context, action);
  }
}
