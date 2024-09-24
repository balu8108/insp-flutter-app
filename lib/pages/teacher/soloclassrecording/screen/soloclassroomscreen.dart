import 'package:flutter/material.dart';
import 'package:insp/pages/teacher/soloclassrecording/widgets/soloclassdescription/soloclass_description.dart';
import 'package:insp/pages/teacher/soloclassrecording/widgets/solorecording/soloclass_recording.dart';

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
        const Expanded(flex: 4, child: SoloclassRecording()),
      ]),
    );
  }
}
