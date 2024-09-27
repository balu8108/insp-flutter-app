import 'package:flutter/material.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/student/library/soloclass/solo_class_detail_screen.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/buildgridview/build_grid_view.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/insp_lecture_card.dart';
import 'package:insp/widget/card/model/lecture_card_model.dart';
import 'package:insp/widget/searchbox/search_box.dart';

class LibraryLectureWidget extends StatefulWidget {
  const LibraryLectureWidget({
    super.key,
    required this.heading,
    required this.allLectureOfTopic,
  });

  final String heading;
  final List<LectureCardModel> allLectureOfTopic;

  @override
  State<StatefulWidget> createState() {
    return _LibraryLectureWidgetState();
  }
}

class _LibraryLectureWidgetState extends State<LibraryLectureWidget> {
  List<LectureCardModel> filteredAssignmentTopics = [];
  @override
  void initState() {
    super.initState();
    filteredAssignmentTopics = widget.allLectureOfTopic;
  }

  void _filterWithQueryText(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredAssignmentTopics = widget.allLectureOfTopic
            .where((it) =>
                it.name.toLowerCase().contains(query.toLowerCase()) ||
                it.topicName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredAssignmentTopics = widget.allLectureOfTopic;
      });
    }
  }

  void _onPressedMyCourse(
      BuildContext context, LectureCardModel lectureCardModel) {
    pushWithoutAnimation(
        context,
        SoloClassDetailsScreen.getScreen(
            lectureCardModel, true, widget.allLectureOfTopic));
  }

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
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
                    Expanded(flex: 5, child: INSPHeading(widget.heading)),
                    searchBox(context, _filterWithQueryText),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    INSPHeading(widget.heading),
                    const SizedBox(
                      height: 10,
                    ),
                    searchBox(context, _filterWithQueryText),
                  ],
                ),
          const SizedBox(height: 16),
          filteredAssignmentTopics.isNotEmpty
              ? BuildGridView(
                  context: context,
                  items: filteredAssignmentTopics,
                  itemBuilder: (context, index) {
                    return INSPLectureCard(
                        lectureCardModel: filteredAssignmentTopics[index],
                        context: context,
                        onPressedViewDetails: _onPressedMyCourse);
                  })
              : const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'No lectures for this topic.',
                    style: TextStyle(fontSize: 16),
                  ),
                )
        ],
      ),
    );
  }
}
