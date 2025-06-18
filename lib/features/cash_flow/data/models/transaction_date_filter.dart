import 'package:intl/intl.dart';

class TransactionDateFilter {
  final DateTime startDateTime;
  final DateTime endDateTime;

  TransactionDateFilter({DateTime? startDate, DateTime? endTime})
    : dateNow = DateTime.now(),
      startDateTime =
          startDate ??
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
      endDateTime =
          endTime ??
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            23,
            59,
            59,
            999,
          );

  final DateTime dateNow;
  final DateFormat formatter = DateFormat("HH:mm");

  String getFormatedStartDateTime() {
    return formatter.format(startDateTime);
  }

  String getFormatedEndDateTime() {
    return formatter.format(endDateTime);
  }
}
