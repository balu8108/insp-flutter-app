import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/chapterdetail/chapter_detail_redux.dart';
import 'package:inspflutterfrontend/chapterdetail/chapter_detail_widget.dart';
import 'package:inspflutterfrontend/chapterdetail/chapter_widget.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

import '../base/base.dart';

class ChapterDetailScreen extends StatelessWidget {
  const ChapterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    dispatch(context, initialFetchTopics(context));

    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, showTopicsForSubject(context, inspCardModel));
    }

    void onPressedTopic(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, sendToTopicLectureScreen(context, inspCardModel));
    }

    return Scaffold(
      appBar: MyAppBar(),
      body: StoreConnector<ChapterDetailAppState, ChapterDetailAppState>(
          converter: (store) => store.state,
          builder: (context, ChapterDetailAppState state) => Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: !isWebOrLandScape
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ChapterWidget(
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
                                      key: UniqueKey(),
                                      allTopicsForSelectedCourse:
                                          state.allChapter,
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
                              Expanded(
                                flex: 3,
                                child: UpcomingClassesScreen.getScreen(),
                              ),
                          ],
                        ),
                ),
              )),
    );
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
