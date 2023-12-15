import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String formatTemperature(double celsiusTemperature, bool isFahrenheit) {
  if (isFahrenheit) {
    double fahrenheitTemperature = (celsiusTemperature * 9 / 5) + 32;
    return "${fahrenheitTemperature.toStringAsFixed(1)} °F";
  } else {
    return "${celsiusTemperature.toStringAsFixed(1)} °C";
  }
}

String extractTime(String dateTimeString) {
  DateTime parsedDate = DateTime.parse(dateTimeString);
  return DateFormat('HH:mm').format(parsedDate);
}

String getDayString(String dateString) {
  initializeDateFormatting('en_US', null);
  DateTime date = DateTime.parse(dateString);
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime yesterday = today.subtract(const Duration(days: 1));
  DateTime tomorrow = today.add(const Duration(days: 1));

  if (date.isAtSameMomentAs(today)) {
    return 'Today';
  } else if (date.isAtSameMomentAs(yesterday)) {
    return 'Yesterday';
  } else if (date.isAtSameMomentAs(tomorrow)) {
    return 'Tomorrow';
  } else {
    return DateFormat('EEEE', 'en_US').format(date);
  }
}
