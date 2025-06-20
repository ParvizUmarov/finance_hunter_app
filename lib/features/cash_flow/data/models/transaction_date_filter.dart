import 'package:finance_hunter_app/core/core.dart';

class TransactionDateFilter {
  final DateTime? startDate;
  final DateTime? endDate;

  TransactionDateFilter({this.startDate, this.endDate});

  String? getFormatedStartDateTime() {
    return startDate == null
        ? null
        : CustomDateFormatter.formatDateWithYearAndMonth(startDate!);
  }

  String? getFormatedEndDateTime() {
    return endDate == null
        ? null
        : CustomDateFormatter.formatDate(endDate!);
  }

  DateTime? getStartDateTime() => startDate;

  DateTime? getEndDateTime() => endDate;

  static DateTime defaultStartTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static DateTime defaultEndTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
  }

}
