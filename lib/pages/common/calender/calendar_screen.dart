import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/calender/widget/liveclass_calendar.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: UpcomingClassesScreen.getScreen(),
            ),
            const SizedBox(width: 17), // Adds spacing between the components
            Expanded(
              flex: 9,
              child: LiveclassCalendar.getScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
