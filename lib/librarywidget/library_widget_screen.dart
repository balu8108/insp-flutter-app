import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/librarywidget/library_widget_redux.dart';

import '../data/hardcoded/library_subjects.dart';

class LibraryWidget extends StatefulWidget {
  const LibraryWidget({super.key, required this.onViewDetailsClicked});

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;

  @override
  State<StatefulWidget> createState() {
    return LibraryWidgetState(onViewDetailsClicked: onViewDetailsClicked);
  }
}

class LibraryWidgetState extends State<LibraryWidget> {
  LibraryWidgetAppState libraryWidgetAppState = const LibraryWidgetAppState();

  LibraryWidgetState({required this.onViewDetailsClicked});

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;

  void updateState(LibraryWidgetAppState libraryWidgetAppState) {
    setState(() {
      this.libraryWidgetAppState = libraryWidgetAppState;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateState(
        libraryWidgetAppState.copyWith(libraryInspCardModels: librarySubjects));
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
          INSPHeading('Library'),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 230.0,
            child: libraryWidgetAppState.libraryInspCardModels.isNotEmpty
                ? Scrollbar(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          libraryWidgetAppState.libraryInspCardModels.length,
                      itemBuilder: (BuildContext context, int index) {
                        return INSPCard(
                            inspCardModel: libraryWidgetAppState
                                .libraryInspCardModels[index],
                            context: context,
                            onPressedViewDetails: onViewDetailsClicked);
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
