import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/widget/buildgridview/build_grid_view.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/insp_lecture_card.dart';
import 'package:inspflutterfrontend/widget/card/model/lecture_card_model.dart';
import 'package:inspflutterfrontend/pages/student/library/librarylecturedetailpage/library_lecture_details_screen.dart';

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
              // searchBox(context, _filterWithQueryText),
            ],
          )
        : Column(
            children: [
              INSPHeading(widget.heading),
              const SizedBox(height: 16),
              // searchBox(context, _filterWithQueryText),
            ],
          );
  }

  void _onPressedMyCourse(
      BuildContext context, LectureCardModel lectureCardModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LibraryLectureDetailsScreen.getScreen(
              lectureCardModel, widget.allLectureOfTopic)),
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
