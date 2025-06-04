import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String toShortDateString() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
