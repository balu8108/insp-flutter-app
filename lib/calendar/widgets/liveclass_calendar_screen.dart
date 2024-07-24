import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/calendar/widgets/liveclass_calendar.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
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
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: UpcomingClassesScreen.getScreen(),
            ),
            const SizedBox(width: 17), // Adds spacing between the components
            const Expanded(
              flex: 9,
              child: LiveclassCalendar(),
            ),
          ],
        ),
      ),
    );
  }
}
