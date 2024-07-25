import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/common/search_box.dart';
import 'package:inspflutterfrontend/library/library_redux.dart';
import 'package:inspflutterfrontend/libraryLecture/library_lecture_screen.dart';

class LibraryDetails extends StatefulWidget {
  final INSPCardModel selectedItem;
  final List<INSPCardModel> allTopicsForSelectedSubject;

  const LibraryDetails({
    Key? key,
    required this.allTopicsForSelectedSubject,
    required this.selectedItem,
  }) : super(key: key);

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
                  ? _buildGridView(
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
