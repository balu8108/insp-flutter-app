import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/assignmenttopic/assignment_topic_screen_redux.dart';
import 'package:inspflutterfrontend/assignmenttopic/assignment_topic_widget.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';
import '../base/base.dart';

class AssignmentTopicScreen extends StatelessWidget {
  const AssignmentTopicScreen({super.key});
  @override
  Widget build(BuildContext context) {
    dispatch(context, initialFetchAssignment(context));
    return Scaffold(
        appBar: MyAppBar(),
        body: StoreConnector<AssignmentTopicScreenAppState,
                AssignmentTopicScreenAppState>(
            converter: (store) => store.state,
            builder: (context, AssignmentTopicScreenAppState state) =>
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
                                      children: [
                                        AssignmentTopicWidget(
                                          heading:
                                              "Assignments (Basic mathematics & vectors)",
                                          allAssignemntofTopic:
                                              state.allAssignmentOfTopic,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 17),
                                  Expanded(
                                    flex: 3,
                                    child: UpcomingClassesScreen.getScreen(),
                                  ),
                                ]))))));
  }

  static getScreen(INSPCardModel selectedtopic) {
    return getBaseScreen<AssignmentTopicScreenAppState, AssignmentTopicScreen>(
        assignmentTopicStateReducer,
        AssignmentTopicScreenAppState(selectedtopic: selectedtopic),
        const AssignmentTopicScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<AssignmentTopicScreenAppState>(context, action);
  }
}
