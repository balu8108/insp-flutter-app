import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/courses/widget/chapterdetail/chapter_widget.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/pages/common/courses/widget/topicorlectureswidget/topic_or_lecture_widget_screen.dart';
import 'package:insp/pages/common/courses/topiclecture/topic_lecture_redux.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';

import '../../../../base/base.dart';

class TopicLectureScreen extends StatelessWidget {
  const TopicLectureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    dispatch(context, initialFetchLecture(context));

    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, showLecturesForTopic(context, inspCardModel));
    }

    return Container(
        padding: isWebOrLandScape
            ? const EdgeInsets.all(10.0)
            : const EdgeInsets.all(0.0),
        color: Colors.white,
        child: StoreConnector<TopicLectureAppState, TopicLectureAppState>(
          converter: (store) => store.state,
          builder: (context, TopicLectureAppState state) =>
              SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
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
                          allTopicsForSelectedCourse: state.allTopics,
                          onViewDetailsClicked: onPressedMyCourse),
                      const SizedBox(height: 16),
                      TopicOrLectureWidget(
                          key: UniqueKey(),
                          heading: 'Topic (${state.selectedTopic.name})',
                          data: state.allTopicBasedLecture,
                          allTopicsForSelectedCourse: const []),
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

  static getScreen(INSPCardModel selectedTopic,
      List<INSPCardModel> allTopicsForSelectedCourse) {
    return getBaseScreen<TopicLectureAppState, TopicLectureScreen>(
        topicLectureReducer,
        TopicLectureAppState(
            selectedTopic: selectedTopic,
            allTopics: allTopicsForSelectedCourse),
        const TopicLectureScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<TopicLectureAppState>(context, action);
  }
}
