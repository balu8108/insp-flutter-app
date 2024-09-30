import 'package:flutter/material.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/common/courses/chapterdetail/chapter_detail_screen.dart';
import 'package:insp/pages/student/library/soloclass/solo_class_detail_screen.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/card/insp_card.dart';
import 'package:insp/widget/buildgridview/build_grid_view.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/widget/card/model/lecture_card_model.dart';
import 'package:insp/pages/student/library/librarylecturedetailpage/library_lecture_details_screen.dart';

import '../../../../../widget/card/insp_lecture_card.dart';
import '../../../../../widget/searchbox/search_box.dart';
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
    if (query.isNotEmpty) {
      if (widget.heading.contains("Physics")) {
        final filteredTopics = _lecturesWidgetAppState
            .allTopicsForSelectedCourse
            .where((it) => it.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        _updateState(_lecturesWidgetAppState.copyWith(
          query: query,
          allTopicsForSelectedCourse: filteredTopics,
        ));
      } else {
        final filteredTopics = _lecturesWidgetAppState
            .filteredLectureForSelectedCourse
            .where((it) =>
                it.name.toLowerCase().contains(query.toLowerCase()) ||
                it.topicName.toLowerCase().contains(query.toLowerCase()))
            .toList();
        _updateState(_lecturesWidgetAppState.copyWith(
          query: query,
          filteredLectureForSelectedCourse: filteredTopics,
        ));
      }
    } else {
      _updateState(_lecturesWidgetAppState.copyWith(
        query: query,
        filteredLectureForSelectedCourse: widget.data,
        allTopicsForSelectedCourse: widget.allTopicsForSelectedCourse,
      ));
    }
  }

  void _onPressedMyCourse(
      BuildContext context, LectureCardModel lectureCardModel) {
    if (widget.heading.toLowerCase().contains('inpho')) {
      pushWithoutAnimation(
          context,
          SoloClassDetailsScreen.getScreen(lectureCardModel, false,
              _lecturesWidgetAppState.filteredLectureForSelectedCourse));
    } else {
      pushWithoutAnimation(
          context,
          LibraryLectureDetailsScreen.getScreen(lectureCardModel,
              _lecturesWidgetAppState.filteredLectureForSelectedCourse));
    }
  }

  void _onPressedMyTopic(BuildContext context, INSPCardModel selectedchapter) {
    pushWithoutAnimation(
        context,
        ChapterDetailScreen.getScreen(selectedchapter,
            _lecturesWidgetAppState.allTopicsForSelectedCourse));
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
          if (widget.heading.contains("Mathematics") ||
              widget.heading.contains("Chemistry"))
            _buildComingSoon()
          else if (widget.heading.contains("Physics"))
            _lecturesWidgetAppState.allTopicsForSelectedCourse.isNotEmpty
                ? BuildGridView(
                    context: context,
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
            BuildGridView(
              context: context,
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
