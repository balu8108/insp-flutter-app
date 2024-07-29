import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/insp_lecture_card.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/common/model/lecture_card_model.dart';
import 'package:inspflutterfrontend/data/remote/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';
import 'package:inspflutterfrontend/librarylecturedetails/library_lecture_details_screen.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_redux.dart';

import '../data/hardcoded/mycourses_subjects.dart';

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

  void onPressedMyCourse(BuildContext context, LectureCardModel inspCardModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LibraryLectureDetailsScreen.getScreen(
                inspCardModel, widget.lectureDetailsForLibrary)));
  }

  @override
  void initState() {
    super.initState();
    // updateState(myCoursesWidgetAppState.copyWith(
    // myCoursesInspCardModels: myCoursesData));
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
          INSPHeading('Physics ( ${widget.heading} )'),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 220.0,
            child: widget.lectureDetailsForLibrary.isNotEmpty
                ? Scrollbar(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
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
