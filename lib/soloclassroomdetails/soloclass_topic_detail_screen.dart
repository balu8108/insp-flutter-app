import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:inspflutterfrontend/soloclassroomdetails/soloclass_topic_detail_redux.dart';
import 'package:inspflutterfrontend/soloclassroomdetails/widgets/soloclassroom_description_widgets.dart';
import 'package:inspflutterfrontend/soloclassroomdetails/widgets/soloclassroom_topics_widgets.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

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
        appBar: MyAppBar(),
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
                                        state.soloclasstopicdetail)
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

  static getScreen() {
    return getBaseScreen<SoloclassTopicDetailReduxAppState,
            SoloclassTopicDetailScreen>(
        soloclassTopicDetailReducer,
        SoloclassTopicDetailReduxAppState(),
        const SoloclassTopicDetailScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<SoloclassTopicDetailReduxAppState>(context, action);
  }
}
