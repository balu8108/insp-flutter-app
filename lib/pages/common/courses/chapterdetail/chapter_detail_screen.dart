import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/courses/chapterdetail/chapter_detail_redux.dart';
import 'package:inspflutterfrontend/pages/common/courses/widget/chapterdetail/chapter_detail_widget.dart';
import 'package:inspflutterfrontend/pages/common/courses/widget/chapterdetail/chapter_widget.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';

import '../../../../base/base.dart';

class ChapterDetailScreen extends StatelessWidget {
  const ChapterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    dispatch(context, initialFetchTopics(context));

    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, showTopicsByChapter(context, inspCardModel));
    }

    void onPressedTopic(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, sendToTopicLectureScreen(context, inspCardModel));
    }

    return Container(
        padding: isWebOrLandScape
            ? const EdgeInsets.all(10.0)
            : const EdgeInsets.all(0.0),
        color: Colors.white,
        child: StoreConnector<ChapterDetailAppState, ChapterDetailAppState>(
          converter: (store) => store.state,
          builder: (context, ChapterDetailAppState state) =>
              SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: !isWebOrLandScape
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChapterWidget(
                          title: "Physics",
                          key: UniqueKey(),
                          allTopicsForSelectedCourse: state.allChapter,
                          onViewDetailsClicked: onPressedMyCourse),
                      const SizedBox(height: 16),
                      ChapterDetailWidget(
                          key: UniqueKey(),
                          allTopics: state.allTopics,
                          selectedChapter: state.selectedchapter,
                          onViewDetailsClicked: onPressedTopic)
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
                            ChapterWidget(
                                title: "Physics",
                                key: UniqueKey(),
                                allTopicsForSelectedCourse: state.allChapter,
                                onViewDetailsClicked: onPressedMyCourse),
                            const SizedBox(height: 16),
                            ChapterDetailWidget(
                                key: UniqueKey(),
                                allTopics: state.allTopics,
                                selectedChapter: state.selectedchapter,
                                onViewDetailsClicked: onPressedTopic)
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

  static getScreen(INSPCardModel selectedchapter,
      List<INSPCardModel> allTopicsForSelectedCourse) {
    return getBaseScreen<ChapterDetailAppState, ChapterDetailScreen>(
        chapterDetailReducer,
        ChapterDetailAppState(
            selectedchapter: selectedchapter,
            allChapter: allTopicsForSelectedCourse),
        const ChapterDetailScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<ChapterDetailAppState>(context, action);
  }
}
