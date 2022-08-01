import 'package:intl/intl.dart';

class CustomDateFormatter {
  static String format({required DateTime value, String format = 'yyyy/MM/dd'}) {
    final dateFormatter = DateFormat(format);
    return dateFormatter.format(value);
  }
}
