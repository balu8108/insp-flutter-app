import 'package:flutter/material.dart';
import 'package:insp/widget/card/insp_card.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/popups/scheduleSoloclass/schedule_soloclass.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 5, child: INSPHeading('Solo Recording')),
              Container(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ScheduleSoloClass.getScreen(
                                0, false, '', '', '', '', '', []);
                          });

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const Soloclassroomscreen()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromRGBO(60, 141, 188, 1),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text("Solo record")),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 230.0,
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
