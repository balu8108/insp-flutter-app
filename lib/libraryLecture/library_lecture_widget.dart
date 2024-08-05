import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/assignments/widgets/assignment_screen_redux.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/file_box_component.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/insp_lecture_card.dart';
import 'package:inspflutterfrontend/common/model/lecture_card_model.dart';
import 'package:inspflutterfrontend/common/model/topic_assignment_card_model.dart';
import 'package:inspflutterfrontend/lecturedetail/lecture_detail_screen.dart';
import 'package:inspflutterfrontend/librarylecturedetails/library_lecture_details_screen.dart';

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
          builder: (context) =>
              // LectureDetailScreen.getScreen(lectureCardModel)),
              LibraryLectureDetailsScreen.getScreen(
                  lectureCardModel, widget.allLectureOfTopic)),
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
          widget.allLectureOfTopic.isNotEmpty
              ? _buildGridView(
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
