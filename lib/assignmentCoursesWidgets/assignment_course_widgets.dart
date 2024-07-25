// this is the header of the  assignments (Phyiscs , Chemistry , Mathemathics)
import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/assignmentCoursesWidgets/assignment_courses_widget_redux.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';

import '../data/hardcoded/mycourses_subjects.dart';

class AssignmentCourseWidgets extends StatefulWidget {
  const AssignmentCourseWidgets(
      {super.key,
      required this.onViewDetailsClicked,
      required this.callCourseApi});

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;
  final void Function() callCourseApi;

  @override
  State<StatefulWidget> createState() {
    return MyCoursesWidgetState(onViewDetailsClicked, callCourseApi);
  }
}

class MyCoursesWidgetState extends State<AssignmentCourseWidgets> {
  AssignmentCoursesWidgetAppState assignmentCoursesWidgetAppState =
      const AssignmentCoursesWidgetAppState();

  MyCoursesWidgetState(this.onViewDetailsClicked, this.callCourseApi);

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;
  final void Function() callCourseApi;

  void updateState(
      AssignmentCoursesWidgetAppState assignmentCoursesWidgetAppState) {
    setState(() {
      this.assignmentCoursesWidgetAppState = assignmentCoursesWidgetAppState;
    });
  }

  @override
  void initState() {
    super.initState();
    // callCourseApi();
    updateState(assignmentCoursesWidgetAppState.copyWith(
        assignmentCoursesInspCardModels: assignmentCoursesData));
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
          INSPHeading('My Courses'),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 220.0,
            child: assignmentCoursesWidgetAppState
                    .assignmentCoursesInspCardModels.isNotEmpty
                ? Scrollbar(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: assignmentCoursesWidgetAppState
                          .assignmentCoursesInspCardModels.length,
                      itemBuilder: (BuildContext context, int index) {
                        return INSPCard(
                            inspCardModel: assignmentCoursesWidgetAppState
                                .assignmentCoursesInspCardModels[index],
                            context: context,
                            onPressedViewDetails: onViewDetailsClicked);
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
