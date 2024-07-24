import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/chapterdetail/chapter_widget.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:inspflutterfrontend/lectureswidget/topic_or_lecture_widget_screen.dart';
import 'package:inspflutterfrontend/topiclecture/topic_lecture_redux.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

import '../base/base.dart';

class TopicLectureScreen extends StatelessWidget {
  const TopicLectureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, initialFetchLecture(context));

    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, showLecturesForTopic(context, inspCardModel));
    }

    void onPressedTopic(BuildContext context, INSPCardModel inspCardModel) {
      // dispatch(context, showTopicsForSubject(context, inspCardModel));
    }

    return Scaffold(
        appBar: MyAppBar(),
        body: StoreConnector<TopicLectureAppState, TopicLectureAppState>(
          converter: (store) => store.state,
          builder: (context, TopicLectureAppState state) => Container(
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
                            ChapterWidget(
                                key: UniqueKey(),
                                allTopicsForSelectedCourse: state.allTopics,
                                onViewDetailsClicked: onPressedMyCourse),
                            const SizedBox(height: 16),
                            TopicOrLectureWidget(
                                key: UniqueKey(),
                                heading: 'Topic (${state.selectedTopic.name})',
                                data: state.allTopicBasedLecture,
                                allTopicsForSelectedCourse: []),
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
