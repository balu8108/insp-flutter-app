import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/common/search_box.dart';
import 'package:inspflutterfrontend/library/library_redux.dart';

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
              : Wrap(
                  spacing: 24.0,
                  runSpacing: 24.0,
                  children: allTopicsForSelectedSubject.map((item) {
                    return SizedBox(
                      width: 268, // Set the fixed width of the card
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Nitin Sachan",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(44, 51, 41, 0.47),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(44, 51, 41, 1),
                                ),
                              ),
                              Text(
                                item.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(44, 51, 41, 0.47),
                                    height: 1.8),
                              ),
                              const SizedBox(height: 12),
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    // Handle "View Details" button press
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets
                                        .zero, // Remove padding if needed
                                    overlayColor: WidgetStateColor.transparent,
                                  ),
                                  child: const Text(
                                    'View Details',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(60, 141, 188, 1),
                                        backgroundColor: Colors.transparent),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
