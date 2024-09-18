import 'package:flutter/material.dart';
import 'package:insp/widget/card/insp_card.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';

class ChapterWidget extends StatefulWidget {
  const ChapterWidget({
    super.key,
    required this.allTopicsForSelectedCourse,
    required this.onViewDetailsClicked,
    required this.title,
  });
  final String title;
  final List<INSPCardModel> allTopicsForSelectedCourse;
  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;

  @override
  State<StatefulWidget> createState() {
    return ChapterWidgetState();
  }
}

class ChapterWidgetState extends State<ChapterWidget> {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 9, child: INSPHeading(widget.title)),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 230.0,
            child: widget.allTopicsForSelectedCourse.isNotEmpty
                ? Scrollbar(
                    controller: _scrollController,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
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
