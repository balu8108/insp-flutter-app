import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/base/base.dart';
import 'package:insp/pages/common/alltopicswidget/all_topics_widget_redux.dart';
import 'package:insp/pages/student/assignment/widget/assignment_subject_topic.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/searchbox/search_box.dart';

class AllTopicWidget extends StatelessWidget {
  final String heading;
  final Function(BuildContext, INSPCardModel) onPressedViewDetails;

  const AllTopicWidget({
    super.key,
    required this.heading,
    required this.onPressedViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    dispatch(context, initialFetchSubjectTopic(context));

    void filterWithQuery(String text) {
      dispatch(context, filterWithQueryText(context, text));
    }

    return StoreConnector<AllTopicsWidgetAppState, AllTopicsWidgetAppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromRGBO(232, 242, 249, 1),
          ),
          child: Column(
            children: [
              isWebOrLandScape
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 5, child: INSPHeading(heading)),
                        searchBox(context, filterWithQuery),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        INSPHeading(heading),
                        const SizedBox(
                          height: 10,
                        ),
                        searchBox(context, filterWithQuery),
                      ],
                    ),
              const SizedBox(height: 16),
              if (heading.contains("Mathematics") ||
                  heading.contains("Chemistry"))
                Column(
                  children: [
                    if (heading.contains("Mathematics"))
                      Image.asset('assets/images/mathematics.png')
                    else
                      Image.asset('assets/images/science.png'),
                    const SizedBox(height: 16),
                    const Text(
                      "Coming Soon",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              else
                AssignmentSubjectTopic(
                  key: UniqueKey(),
                  allSubjectTopics: state.filterSubjectTopics,
                  onViewDetailsClicked: onPressedViewDetails,
                ),
            ],
          ),
        );
      },
    );
  }

  static getScreen(
      {required String heading,
      required Function(BuildContext, INSPCardModel) onPressedViewDetails}) {
    return getBaseScreen<AllTopicsWidgetAppState, AllTopicWidget>(
      allTopicWidgetStateReducer,
      const AllTopicsWidgetAppState(),
      AllTopicWidget(
          heading: heading, onPressedViewDetails: onPressedViewDetails),
    );
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<AllTopicsWidgetAppState>(context, action);
  }
}
