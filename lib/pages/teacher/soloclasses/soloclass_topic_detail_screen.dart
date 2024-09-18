import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/base/base.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';
import 'package:insp/pages/teacher/soloclasses/soloclass_topic_detail_redux.dart';
import 'package:insp/pages/teacher/soloclasses/widget/soloclassroom_description_widgets.dart';
import 'package:insp/pages/teacher/soloclasses/widget/soloclassroom_topics_widgets.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';

class SoloclassTopicDetailScreen extends StatelessWidget {
  const SoloclassTopicDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(
          context, fetchTopicsDetailForSoloClassRoom(context, inspCardModel));
    }

    dispatch(context, initialFetchTopics(context));

    return Container(
      padding: isWebOrLandScape
          ? const EdgeInsets.all(10.0)
          : const EdgeInsets.all(0.0),
      color: Colors.white,
      child: StoreConnector<SoloclassTopicDetailReduxAppState,
          SoloclassTopicDetailReduxAppState>(
        converter: (store) => store.state,
        builder: (context, SoloclassTopicDetailReduxAppState state) =>
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
                    SoloclassroomTopicsWidgets(
                      onViewDetailsClicked: onPressedMyCourse,
                      allTopics: state.allTopics,
                    ),
                    const SizedBox(height: 16),
                    SoloclassroomDescriptionWidgets(
                        soloclasstopicdetail: state.soloclasstopicdetail,
                        selectedTopic: state.selectedTopic)
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

  static getScreen(INSPCardModel selectedTopic) {
    return getBaseScreen<SoloclassTopicDetailReduxAppState,
            SoloclassTopicDetailScreen>(
        soloclassTopicDetailReducer,
        SoloclassTopicDetailReduxAppState(selectedTopic: selectedTopic),
        const SoloclassTopicDetailScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<SoloclassTopicDetailReduxAppState>(context, action);
  }
}
