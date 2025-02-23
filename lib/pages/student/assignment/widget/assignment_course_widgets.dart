import 'package:flutter/material.dart';
import 'package:insp/widget/card/insp_card.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import '../../../../data/hardcoded/mycourses_subjects.dart';

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
  MyCoursesWidgetState(this.onViewDetailsClicked, this.callCourseApi);

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;
  final void Function() callCourseApi;
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
            children: [
              Expanded(child: INSPHeading('My Assignments')),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 210, // Set a fixed height for the ListView
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 8,
                  child: assignmentCoursesData.isNotEmpty
                      ? Scrollbar(
                          controller: _scrollController,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController,
                            itemCount: assignmentCoursesData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return INSPCard(
                                inspCardModel: assignmentCoursesData[index],
                                context: context,
                                onPressedViewDetails: onViewDetailsClicked,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 33,
                              );
                            },
                          ),
                        )
                      : const Center(child: Text('No items')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
