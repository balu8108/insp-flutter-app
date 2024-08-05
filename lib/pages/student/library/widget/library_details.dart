import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/widget/card/insp_card.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/searchbox/search_box.dart';
import 'package:inspflutterfrontend/pages/student/library/mainpage/library_redux.dart';
import 'package:inspflutterfrontend/pages/student/library/librarylecturepage/library_lecture_screen.dart';
import 'package:inspflutterfrontend/widget/buildgridview/build_grid_view.dart';

class LibraryDetails extends StatefulWidget {
  const LibraryDetails({
    Key? key,
    required this.allTopicsForSelectedSubject,
    required this.selectedItem,
  }) : super(key: key);

  final INSPCardModel selectedItem;
  final List<INSPCardModel> allTopicsForSelectedSubject;

  @override
  State<LibraryDetails> createState() => _LibraryDetailsState();
}

class _LibraryDetailsState extends State<LibraryDetails> {
  void _onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LibraryLectureScreen.getScreen(inspCardModel)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedItem = widget.selectedItem;
    final allTopicsForSelectedSubject = widget.allTopicsForSelectedSubject;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Color.fromRGBO(232, 242, 249, 1),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 25,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 141, 188, 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Library (${selectedItem.name})',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              searchBox(context, filterWithQueryText),
            ],
          ),
          const SizedBox(height: 16),
          selectedItem.name == "Mathematics" || selectedItem.name == "Chemistry"
              ? Center(
                  child: Column(
                    children: [
                      if (selectedItem.name == "Mathematics")
                        Image.asset('assets/images/mathematics.png')
                      else
                        Image.asset('assets/images/science.png'),
                      const SizedBox(height: 16),
                      const Text(
                        "Coming Soon",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                )
              : allTopicsForSelectedSubject.isNotEmpty
                  ? BuildGridView(
                      context: context,
                      items: allTopicsForSelectedSubject,
                      itemBuilder: (context, index) {
                        return INSPCard(
                            inspCardModel: allTopicsForSelectedSubject[index],
                            context: context,
                            onPressedViewDetails: _onPressedMyCourse);
                      })
                  : const Center(child: Text('No items')),
        ],
      ),
    );
  }
}
