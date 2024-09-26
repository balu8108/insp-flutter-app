import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/base/base.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/student/dashboard/assignment/assignment_widget_redux.dart';
import 'package:insp/pages/teacher/uploads/mainpage/myuploads.dart';
import 'package:insp/widget/card/latest_assignment_card.dart';
import 'package:insp/widget/heading/insp_heading.dart';

class AssignmentWidget extends StatelessWidget {
  const AssignmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    dispatch(context, showRecentAssignment(context));
    return StoreConnector<AssignmentWidgetAppState, AssignmentWidgetAppState>(
      converter: (store) => store.state,
      builder: (context, AssignmentWidgetAppState state) => Container(
        height: 270, // Height of the container
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
                Expanded(flex: 9, child: INSPHeading('Assignment')),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      pushWithoutAnimation(context, const MyUploads());
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                          color: Color.fromRGBO(44, 51, 41, 1), fontSize: 14),
                    ))
              ],
            ),
            const SizedBox(height: 17),
            state.allRecentAssignment.isNotEmpty
                ? Expanded(
                    child: Scrollbar(
                      controller: scrollController,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        controller: scrollController,
                        itemCount: state.allRecentAssignment.length,
                        itemBuilder: (BuildContext context, int index) {
                          return LatestAssignmentCard(
                            assignmentCardModel:
                                state.allRecentAssignment[index],
                            context: context,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 5);
                        },
                      ),
                    ),
                  )
                : const Center(child: Text('No Data')),
          ],
        ),
      ),
    );
  }

  static getScreen() {
    return getBaseScreen<AssignmentWidgetAppState, AssignmentWidget>(
      assignmentWidgetReducer,
      const AssignmentWidgetAppState(),
      const AssignmentWidget(),
    );
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<AssignmentWidgetAppState>(context, action);
  }
}
