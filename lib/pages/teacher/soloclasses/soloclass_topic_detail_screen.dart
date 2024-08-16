import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';
import 'package:inspflutterfrontend/pages/teacher/soloclasses/soloclass_topic_detail_redux.dart';
import 'package:inspflutterfrontend/pages/teacher/soloclasses/widget/soloclassroom_description_widgets.dart';
import 'package:inspflutterfrontend/pages/teacher/soloclasses/widget/soloclassroom_topics_widgets.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';

class SoloclassTopicDetailScreen extends StatelessWidget {
  const SoloclassTopicDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(
          context, fetchTopicsDetailForSoloClassRoom(context, inspCardModel));
    }

    dispatch(context, initialFetchTopics(context));

    return Scaffold(
        appBar: Navbar(),
        body: StoreConnector<SoloclassTopicDetailReduxAppState,
            SoloclassTopicDetailReduxAppState>(
          converter: (store) => store.state,
          builder: (context, SoloclassTopicDetailReduxAppState state) =>
              Container(
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
                                SoloclassroomTopicsWidgets(
                                  onViewDetailsClicked: onPressedMyCourse,
                                  allTopics: state.allTopics,
                                ),
                                const SizedBox(height: 16),
                                SoloclassroomDescriptionWidgets(
                                    soloclasstopicdetail:
                                        state.soloclasstopicdetail,
                                    selectedTopic: state.selectedTopic)
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
