import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/common/model/lecture_card_model.dart';

import '../common/insp_lecture_card.dart';
import '../common/search_box.dart';
import 'topic_or_lecture_widget_state.dart';

class TopicOrLectureWidget extends StatefulWidget {
   const TopicOrLectureWidget({super.key,required this.inspCards, required this.onViewDetailsClicked, required this.heading});

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;

  final List<INSPCardModel> inspCards;

  final String heading;

  void printlec(){
    print('hello ${this.inspCards}');
  }

  @override
  State<StatefulWidget> createState() {
    printlec();
    return TopicOrLectureWidgetState(onViewDetailsClicked,inspCards,heading);
  }
}

class TopicOrLectureWidgetState extends State<TopicOrLectureWidget> {

  TopicOrLectureWidgetState(this.onViewDetailsClicked, this.lectureCards, this.heading);

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;

  final List<INSPCardModel> lectureCards;

  final String heading;

  LecturesWidgetAppState lecturesWidgetAppState = LecturesWidgetAppState();

  void updateState(LecturesWidgetAppState lecturesWidgetAppState) {
    setState(() {
      this.lecturesWidgetAppState = lecturesWidgetAppState;
    });
  }

  @override
  void initState() {
    super.initState();
    print('bala $lecturesWidgetAppState');
  }

  @override
  Widget build(BuildContext context) {

    void filterWithQueryText(String query) {
      updateState(lecturesWidgetAppState.copyWith(query: query));
      final filteredTopics = lecturesWidgetAppState.allTopicsForSelectedCourse.where((it) {
        if (it is LectureCardModel) {
          return it.topicName.toLowerCase().contains(query.toLowerCase());
        } else {
          return it.name.toLowerCase().contains(query.toLowerCase());
        }
      }).toList();
      updateState(lecturesWidgetAppState.copyWith(filteredTopicsForSelectedCourse: filteredTopics));
    }

    updateState(lecturesWidgetAppState.copyWith(allTopicsForSelectedCourse: this.lectureCards,filteredTopicsForSelectedCourse: this.lectureCards));

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(
        children: [
          context.isWebOrLandScape()?Row(
            children: [
              INSPHeading(heading),
              const Spacer(),
              searchBox(context,filterWithQueryText),
            ],
          ): Column(
            children: [
              INSPHeading(heading),
              const SizedBox(height: 16,),
              searchBox(context,filterWithQueryText),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          lecturesWidgetAppState.filteredTopicsForSelectedCourse.isNotEmpty
              ? GridView.builder(
            itemCount:
            lecturesWidgetAppState.filteredTopicsForSelectedCourse.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final cardModel = lecturesWidgetAppState
                  .filteredTopicsForSelectedCourse[index];
              if (cardModel is LectureCardModel) {
                return INSPLectureCard(
                    lectureCardModel: cardModel,
                    context: context,
                    onPressedViewDetails:
                        (LectureCardModel) {});
              }
              return INSPCard(
                  inspCardModel: cardModel,
                  context: context,
                  onPressedViewDetails:
                      (BuildContext, INSPCardModel) {});
            },
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.isWebOrLandScape()?3:1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 230),
          )
              : const Center(child: Text('No items')),
        ],
      ),
    );
  }
}
