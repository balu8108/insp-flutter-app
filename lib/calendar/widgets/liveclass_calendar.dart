import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class LiveclassCalendar extends StatefulWidget {
  const LiveclassCalendar({super.key});

  @override
  State<LiveclassCalendar> createState() => _LiveclassCalendarState();
}

class _LiveclassCalendarState extends State<LiveclassCalendar> {
  late ValueNotifier<DateTime> _selectedDay;
  late DateTime _focusedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());
    _focusedDay = DateTime.now();
  }

  @override
  void dispose() {
    _selectedDay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(251, 50.0),
                backgroundColor:
                    const Color.fromRGBO(60, 141, 188, 1), // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Border radius
                ),
              ),
              onPressed: () {
                // Handle button press
              },
              child: const Text(
                'View Time Table',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            child: ValueListenableBuilder<DateTime>(
              valueListenable: _selectedDay,
              builder: (context, selectedDay, _) {
                return TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  rowHeight: 60,
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) {
                    return isSameDay(selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay.value, selectedDay)) {
                      _selectedDay.value = selectedDay;
                      setState(() {
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  onDayLongPressed: (day, focusedDay) {
                    _selectedDay.value = day;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
