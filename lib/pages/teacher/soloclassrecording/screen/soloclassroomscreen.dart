import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/teacher/soloclassrecording/widgets/soloclassdescription/soloclass_description.dart';
import 'package:inspflutterfrontend/pages/teacher/soloclassrecording/widgets/solorecording/soloclass_recording.dart';

class Soloclassroomscreen extends StatelessWidget {
  const Soloclassroomscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(43, 26, 43, 26),
      child: Row(children: [
        Expanded(flex: 1, child: SoloclassDescription()),
        Expanded(flex: 1, child: SoloclassRecording()),
      ]),
    );
  }
}
