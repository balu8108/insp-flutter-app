import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/lecture_card_model.dart';
import 'package:insp/pages/student/library/librarylecturedetailpage/lecture_detail_redux.dart';
import 'package:insp/pages/common/lecture/widget/lecture_detail_widget.dart';
import 'package:insp/pages/student/library/widget/library_allLecture.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';

import '../../../../base/base.dart';

class LibraryLectureDetailsScreen extends StatelessWidget {
  const LibraryLectureDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    dispatch(context, initialFetchLectureDetail(context));

    return Container(
      padding: isWebOrLandScape
          ? const EdgeInsets.all(10.0)
          : const EdgeInsets.all(0.0),
      color: Colors.white,
      child: StoreConnector<LectureDetailAppState, LectureDetailAppState>(
        converter: (store) => store.state,
        builder: (context, LectureDetailAppState state) =>
            SingleChildScrollView(
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
              if (isWebOrLandScape) const SizedBox(width: 17),
              if (isWebOrLandScape)
                const Expanded(
                  flex: 3,
                  child: UpcomingClassesScreen(),
                ),
            ],
          ),
        ),
      ),
    );
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
