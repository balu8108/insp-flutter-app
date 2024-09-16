import 'package:flutter/material.dart';
import 'package:insp/main.dart';
import 'package:insp/widget/buildgridview/build_grid_view.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/insp_lecture_card.dart';
import 'package:insp/widget/card/model/lecture_card_model.dart';
import 'package:insp/pages/student/library/librarylecturedetailpage/library_lecture_details_screen.dart';

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
  @override
  void initState() {
    super.initState();
  }

  void _onPressedMyCourse(
      BuildContext context, LectureCardModel lectureCardModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MainScaffold(
              content: LibraryLectureDetailsScreen.getScreen(
                  lectureCardModel, widget.allLectureOfTopic))),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 5, child: INSPHeading(widget.heading)),
              // searchBox(context, _filterWithQueryText),
            ],
          ),
          const SizedBox(height: 16),
          widget.allLectureOfTopic.isNotEmpty
              ? BuildGridView(
                  context: context,
                  items: widget.allLectureOfTopic,
                  itemBuilder: (context, index) {
                    return INSPLectureCard(
                        lectureCardModel: widget.allLectureOfTopic[index],
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
