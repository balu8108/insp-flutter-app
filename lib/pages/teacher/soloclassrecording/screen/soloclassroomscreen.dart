import 'package:flutter/material.dart';
import 'package:insp/pages/teacher/soloclassrecording/widgets/soloclassdescription/soloclass_description.dart';
import 'package:insp/pages/teacher/soloclassrecording/widgets/solorecording/soloclass_recording.dart';

class Soloclassroomscreen extends StatelessWidget {
  const Soloclassroomscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(43, 26, 43, 26),
      child: const Row(children: [
        Expanded(flex: 1, child: SoloclassDescription()),
        SizedBox(width: 16),
        Expanded(flex: 4, child: SoloclassRecording()),
      ]),
    );
  }
}
