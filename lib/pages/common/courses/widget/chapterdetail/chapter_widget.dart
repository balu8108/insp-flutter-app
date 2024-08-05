import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/widget/card/insp_card.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';

class ChapterWidget extends StatefulWidget {
  const ChapterWidget(
      {super.key,
      required this.allTopicsForSelectedCourse,
      required this.onViewDetailsClicked});

  final List<INSPCardModel> allTopicsForSelectedCourse;
  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;

  @override
  State<StatefulWidget> createState() {
    return ChapterWidgetState();
  }
}

class ChapterWidgetState extends State<ChapterWidget> {
  @override
  void initState() {
    super.initState();
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
          INSPHeading('Physics'),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 230.0,
            child: widget.allTopicsForSelectedCourse.isNotEmpty
                ? Scrollbar(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.allTopicsForSelectedCourse.length,
                      itemBuilder: (BuildContext context, int index) {
                        return INSPCard(
                            inspCardModel:
                                widget.allTopicsForSelectedCourse[index],
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
