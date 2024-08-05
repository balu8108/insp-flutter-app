import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/widget/card/insp_card.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';

import '../../../../data/hardcoded/library_subjects.dart';

class LibrarySubject extends StatefulWidget {
  const LibrarySubject({super.key, required this.onViewDetailsClicked});

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;

  @override
  State<StatefulWidget> createState() {
    return LibrarySubjectState();
  }
}

class LibrarySubjectState extends State<LibrarySubject> {
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
            child: librarySubjects.isNotEmpty
                ? Scrollbar(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: librarySubjects.length,
                      itemBuilder: (BuildContext context, int index) {
                        return INSPCard(
                            inspCardModel: librarySubjects[index],
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
