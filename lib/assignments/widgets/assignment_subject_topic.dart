import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/common/search_box.dart';

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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildGridView(
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
