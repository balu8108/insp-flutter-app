import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/pages/student/dashboard/assignment/assignment_widget_redux.dart';
import 'package:inspflutterfrontend/widget/card/latest_assignment_card.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';

class AssignmentWidget extends StatelessWidget {
  const AssignmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
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
            INSPHeading('Assignment'),
            const SizedBox(height: 17),
            state.allRecentAssignment.isNotEmpty
                ? Expanded(
                    child: Scrollbar(
                      controller: _scrollController,
                      child: ListView.separated(
                        controller: _scrollController,
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
                : const Center(child: Text('No item')),
          ],
        ),
      ),
    );
  }

  static getScreen() {
    return getBaseScreen<AssignmentWidgetAppState, AssignmentWidget>(
      assignmentWidgetReducer,
      AssignmentWidgetAppState(),
      const AssignmentWidget(),
    );
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<AssignmentWidgetAppState>(context, action);
  }
}
