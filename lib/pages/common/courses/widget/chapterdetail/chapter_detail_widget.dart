import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/widget/card/insp_card.dart';
import 'package:inspflutterfrontend/widget/buildgridview/build_grid_view.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/searchbox/search_box.dart';

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
  @override
  void initState() {
    super.initState();
  }

  void _filterWithQueryText(String query) {
    final filteredTopics = widget.allTopics
        .where((it) => it.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Widget _buildHeading(BuildContext context) {
    return context.isWebOrLandScape()
        ? Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF3C8DBC),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.selectedChapter.name}',
                    style: const TextStyle(
                        fontSize: 16, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              const Spacer(),
              searchBox(context, _filterWithQueryText),
            ],
          )
        : Column(
            children: [
              INSPHeading(widget.selectedChapter.name),
              const SizedBox(height: 16),
              searchBox(context, _filterWithQueryText),
            ],
          );
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
          _buildHeading(context),
          const SizedBox(
            height: 16,
          ),
          widget.allTopics.isNotEmpty
              ? BuildGridView(
                  context: context,
                  items: widget.allTopics,
                  itemBuilder: (context, index) {
                    final cardModel = widget.allTopics[index];
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
