import 'package:flutter/material.dart';
import 'package:insp/pages/common/calender/widget/liveclass_calendar.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_screen.dart';
import 'package:insp/utils/extensions.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    return Padding(
      padding: isWebOrLandScape
          ? const EdgeInsets.all(16.0)
          : const EdgeInsets.all(0.0),
      child: Row(
        children: [
          if (isWebOrLandScape)
            const Expanded(
              flex: 3,
              child: UpcomingClassesScreen(),
            ),
          if (isWebOrLandScape) const SizedBox(width: 17),
          Expanded(
            flex: isWebOrLandScape ? 9 : 12, // Adjust flex for mobile
            child: LiveclassCalendar.getScreen(),
          ),
        ],
      ),
    );
  }
}
