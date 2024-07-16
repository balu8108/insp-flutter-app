import 'package:intl/intl.dart';

String convertTime(String time24) {
  // Parse the input time in 24-hour format
  DateTime dateTime = DateFormat('HH:mm:ss').parse(time24);

  // Format the DateTime object to 12-hour format with AM/PM
  String time12 = DateFormat('hh:mm a').format(dateTime);

  return time12;
}

String formatDate(String dateString) {
  try {
    // Parse the date string into a DateTime object
    DateTime dateTime = DateTime.parse(dateString);

    // Format the DateTime object to the desired date string format
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    return formattedDate;
  } catch (e) {
    // Handle invalid date format
    return "Invalid date format";
  }
}
