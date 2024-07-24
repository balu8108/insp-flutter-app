import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/chapterdetail/chapter_detail_screen.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/common/model/lecture_card_model.dart';
import 'package:inspflutterfrontend/lecturedetail/lecture_detail_screen.dart';

import '../common/insp_lecture_card.dart';
import '../common/search_box.dart';
import 'topic_or_lecture_widget_state.dart';

class TopicOrLectureWidget extends StatefulWidget {
  const TopicOrLectureWidget({
    super.key,
    required this.heading,
    required this.data,
    required this.allTopicsForSelectedCourse,
  });

  final String heading;
  final List<LectureCardModel> data;
  final List<INSPCardModel> allTopicsForSelectedCourse;

  @override
  State<StatefulWidget> createState() {
    return _TopicOrLectureWidgetState();
  }
}

class _TopicOrLectureWidgetState extends State<TopicOrLectureWidget> {
  late LecturesWidgetAppState _lecturesWidgetAppState;

  @override
  void initState() {
    super.initState();
    _lecturesWidgetAppState = LecturesWidgetAppState(
      filteredLectureForSelectedCourse: widget.data,
      allTopicsForSelectedCourse: widget.allTopicsForSelectedCourse,
    );
  }

  void _updateState(LecturesWidgetAppState newState) {
    setState(() {
      _lecturesWidgetAppState = newState;
    });
  }

  void _filterWithQueryText(String query) {
    final filteredTopics = _lecturesWidgetAppState.allLectureForSelectedCourse
        .where((it) => it.topicName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    _updateState(_lecturesWidgetAppState.copyWith(
      query: query,
      filteredLectureForSelectedCourse: filteredTopics,
    ));
  }

  void _onPressedMyCourse(
      BuildContext context, LectureCardModel lectureCardModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LectureDetailScreen.getScreen(lectureCardModel)),
    );
  }

  void _onPressedMyTopic(BuildContext context, INSPCardModel selectedchapter) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChapterDetailScreen.getScreen(selectedchapter,
              _lecturesWidgetAppState.allTopicsForSelectedCourse)),
    );
  }

  Widget _buildHeading(BuildContext context) {
    return context.isWebOrLandScape()
        ? Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF3C8DBC),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.heading,
                    style: const TextStyle(
                        fontSize: 16, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              const Spacer(),
              searchBox(context, _filterWithQueryText),
            ],
          )
        : Column(
            children: [
              INSPHeading(widget.heading),
              const SizedBox(height: 16),
              searchBox(context, _filterWithQueryText),
            ],
          );
  }

  Widget _buildComingSoon() {
    final assetPath = widget.heading == "Mathematics"
        ? 'assets/images/mathematics.png'
        : 'assets/images/science.png';

    return Column(
      children: [
        Image.asset(assetPath),
        const SizedBox(height: 16),
        const Text("Coming Soon", style: TextStyle(fontSize: 20)),
      ],
    );
  }

  Widget _buildGridView({
    required List<dynamic> items,
    required Widget Function(BuildContext, int) itemBuilder,
  }) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: itemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isWebOrLandScape() ? 3 : 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 230,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(
        children: [
          _buildHeading(context),
          const SizedBox(height: 16),
          if (widget.heading == "Mathematics" || widget.heading == "Chemistry")
            _buildComingSoon()
          else if (widget.heading == 'My Courses (Physics)')
            _lecturesWidgetAppState.allTopicsForSelectedCourse.isNotEmpty
                ? _buildGridView(
                    items: _lecturesWidgetAppState.allTopicsForSelectedCourse,
                    itemBuilder: (context, index) {
                      final cardModel = _lecturesWidgetAppState
                          .allTopicsForSelectedCourse[index];
                      return INSPCard(
                        inspCardModel: cardModel,
                        context: context,
                        onPressedViewDetails: _onPressedMyTopic,
                      );
                    },
                  )
                : const Center(child: Text('No items'))
          else if (_lecturesWidgetAppState
              .filteredLectureForSelectedCourse.isNotEmpty)
            _buildGridView(
              items: _lecturesWidgetAppState.filteredLectureForSelectedCourse,
              itemBuilder: (context, index) {
                final cardModel = _lecturesWidgetAppState
                    .filteredLectureForSelectedCourse[index];
                return INSPLectureCard(
                  lectureCardModel: cardModel,
                  context: context,
                  onPressedViewDetails: _onPressedMyCourse,
                );
              },
            )
          else
            const Center(child: Text('No items')),
        ],
      ),
    );
  }
}
