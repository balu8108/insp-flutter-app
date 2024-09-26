import 'package:flutter/material.dart';
import 'package:insp/main.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/insp_lecture_card.dart';
import 'package:insp/widget/card/model/lecture_card_model.dart';
import 'package:insp/pages/student/library/librarylecturedetailpage/library_lecture_details_screen.dart';

class LibraryAlllectureWidget extends StatefulWidget {
  const LibraryAlllectureWidget({
    super.key,
    required this.lectureDetailsForLibrary,
    required this.heading,
  });

  final String heading;
  final List<LectureCardModel> lectureDetailsForLibrary;

  @override
  State<StatefulWidget> createState() {
    return LibraryAlllectureWidgetState();
  }
}

class LibraryAlllectureWidgetState extends State<LibraryAlllectureWidget> {
  LibraryAlllectureWidgetState();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void onPressedMyCourse(BuildContext context, LectureCardModel inspCardModel) {
    pushWithoutAnimation(
        context,
        LibraryLectureDetailsScreen.getScreen(
            inspCardModel, widget.lectureDetailsForLibrary));
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
              Expanded(
                  flex: 9, child: INSPHeading('Physics ( ${widget.heading} )')),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 220.0,
            child: widget.lectureDetailsForLibrary.isNotEmpty
                ? Scrollbar(
                    controller: _scrollController,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      itemCount: widget.lectureDetailsForLibrary.length,
                      itemBuilder: (BuildContext context, int index) {
                        return INSPLectureCard(
                            lectureCardModel:
                                widget.lectureDetailsForLibrary[index],
                            context: context,
                            onPressedViewDetails: onPressedMyCourse);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 16,
                        );
                      },
                    ),
                  )
                : const Center(child: Text('No items')),
          ),
        ],
      ),
    );
  }
}
