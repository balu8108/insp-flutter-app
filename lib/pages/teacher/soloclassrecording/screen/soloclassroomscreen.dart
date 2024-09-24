import 'package:flutter/material.dart';
import 'package:insp/pages/teacher/soloclassrecording/widgets/soloclassdescription/soloclass_description.dart';
import 'package:insp/pages/teacher/soloclassrecording/widgets/solorecording/soloclass_recording.dart';
import 'package:insp/widget/popups/leave_solo_class.dart';

class Soloclassroomscreen extends StatelessWidget {
  final String soloClassId;

  const Soloclassroomscreen({super.key, required this.soloClassId});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(20),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            flex: 1, child: SoloclassDescription(soloClassId: soloClassId)),
        const SizedBox(width: 16),
        Expanded(
            flex: 4,
            child: Column(
              children: [
                const SoloclassRecording(),
                Container(
                    height: 50,
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: Color.fromRGBO(232, 242, 249, 1),
                    ),
                    child: Row(children: [
                      SizedBox(
                        width: 100,
                        height: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 30.0),
                            backgroundColor: const Color(0xFFF63F4A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const LeaveSoloClassPopup();
                              },
                            );
                          },
                          child: const Text(
                            'End',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ]))
              ],
            )),
      ]),
    );
  }
}
