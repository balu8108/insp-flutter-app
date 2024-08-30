import 'package:intl/intl.dart';

String formatTime(String? time) {
  if (time == null || time.isEmpty) {
    return "No Data";
  }
  DateTime parsedTime = DateFormat("HH:mm").parse(time);
  return DateFormat("hh:mm a").format(parsedTime);
}
