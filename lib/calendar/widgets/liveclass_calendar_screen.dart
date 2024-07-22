// import 'package:flutter/material.dart';
// import 'package:inspflutterfrontend/calendar/widgets/liveclass_calendar.dart';
// import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

// class LiveclassCalendarScreen extends StatefulWidget {
//   const LiveclassCalendarScreen({super.key});

//   @override
//   State<LiveclassCalendarScreen> createState() =>
//       _LiveclassCalendarScreenState();
// }

// class _LiveclassCalendarScreenState extends State<LiveclassCalendarScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Container(
//         child: const SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment
//                 .start, // Aligns children to the start of the cross axis
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment
//                     .start, // Aligns children to the start of the cross axis
//                 children: [
//                   // Flexible(
//                   //   flex: 2,
//                   //   child: UpcomingClassesScreen(),
//                   // ),
//                   const SizedBox(width: 24),
//                   Flexible(
//                     flex: 8,
//                     child: LiveclassCalendar(),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/calendar/widgets/liveclass_calendar.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';

class LiveclassCalendarScreen extends StatefulWidget {
  const LiveclassCalendarScreen({super.key});

  @override
  State<LiveclassCalendarScreen> createState() =>
      _LiveclassCalendarScreenState();
}

class _LiveclassCalendarScreenState extends State<LiveclassCalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: UpcomingClassesScreen(),
            ),
            SizedBox(width: 24), // Adds spacing between the components
            Expanded(
              flex: 7,
              child: LiveclassCalendar(),
            ),
          ],
        ),
      ),
    );
  }
}
