import 'package:flutter/material.dart';
import 'package:insp/widget/card/insp_card.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/widget/buildgridview/build_grid_view.dart';

class AssignmentSubjectTopic extends StatefulWidget {
  const AssignmentSubjectTopic(
      {super.key,
      required this.allSubjectTopics,
      required this.onViewDetailsClicked});
  final List<INSPCardModel> allSubjectTopics;
  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;
  @override
  State<AssignmentSubjectTopic> createState() => _AssignmentSubjectTopicState();
}

class _AssignmentSubjectTopicState extends State<AssignmentSubjectTopic> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BuildGridView(
        context: context,
        items: widget.allSubjectTopics,
        itemBuilder: (context, index) {
          final cardModel = widget.allSubjectTopics[index];
          return INSPCard(
            inspCardModel: cardModel,
            context: context,
            onPressedViewDetails: widget.onViewDetailsClicked,
          );
        },
      )
    ]);
  }
}
