import 'package:flutter/material.dart';
import 'package:insp/widget/card/insp_card.dart';
import 'package:insp/widget/buildgridview/build_grid_view.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/widget/searchbox/search_box.dart';

class ChapterDetailWidget extends StatefulWidget {
  const ChapterDetailWidget(
      {super.key,
      required this.allTopics,
      required this.selectedChapter,
      required this.onViewDetailsClicked});

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;
  final List<INSPCardModel> allTopics;
  final INSPCardModel selectedChapter;

  @override
  State<StatefulWidget> createState() {
    return ChapterDetailWidgetState();
  }
}

class ChapterDetailWidgetState extends State<ChapterDetailWidget> {
  List<INSPCardModel> filteredTopics = [];

  @override
  void initState() {
    super.initState();
    filteredTopics = widget.allTopics;
  }

  void _filterWithQueryText(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredTopics = widget.allTopics
            .where((it) => it.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredTopics = widget.allTopics;
      });
    }
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
              Expanded(
                  flex: 5, child: INSPHeading(widget.selectedChapter.name)),
              searchBox(context, _filterWithQueryText),
            ],
          ),
          const SizedBox(height: 16),
          filteredTopics.isNotEmpty
              ? BuildGridView(
                  context: context,
                  items: filteredTopics,
                  itemBuilder: (context, index) {
                    final cardModel = filteredTopics[index];
                    return INSPCard(
                      inspCardModel: cardModel,
                      context: context,
                      onPressedViewDetails: widget.onViewDetailsClicked,
                    );
                  },
                )
              : const Center(child: Text('No items')),
        ],
      ),
    );
  }
}
