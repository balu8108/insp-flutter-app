import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';

class SoloclassroomTopicsWidgets extends StatefulWidget {
  const SoloclassroomTopicsWidgets(
      {super.key, required this.allTopics, required this.onViewDetailsClicked});
  final List<INSPCardModel> allTopics;
  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;

  @override
  State<SoloclassroomTopicsWidgets> createState() =>
      _SoloclassroomTopicsWidgetsState();
}

class _SoloclassroomTopicsWidgetsState
    extends State<SoloclassroomTopicsWidgets> {
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
          INSPHeading('Solo Class'),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 220.0,
            child: widget.allTopics.isNotEmpty
                ? Scrollbar(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.allTopics.length,
                      itemBuilder: (BuildContext context, int index) {
                        return INSPCard(
                            inspCardModel: widget.allTopics[index],
                            context: context,
                            onPressedViewDetails: widget.onViewDetailsClicked);
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
