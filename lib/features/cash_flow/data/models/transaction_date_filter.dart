class TransactionDateFilter {
  final DateTime? startDate;
  final DateTime? endDate;
  final String? sortedType;

  TransactionDateFilter({this.startDate, this.endDate, this.sortedType});

  DateTime? get startDateTime => startDate;

  DateTime? get endDateTime {
    if (endDate != null) {
      return DateTime(
        endDate!.year,
        endDate!.month,
        endDate!.day, 23, 59, 59, 999,
      );
    } else {
      return endDate;
    }
  }

  static DateTime defaultStartTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static DateTime defaultEndTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
  }

  static DateTime defaultStartMonth() {
    final now = DateTime.now();
    final oneMonthAgo = DateTime(now.year, now.month - 1, now.day);
    return DateTime(oneMonthAgo.year, oneMonthAgo.month, oneMonthAgo.day);
  }
}
