import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:custom_fl_chart/custom_fl_chart.dart';

part 'bar_chart_state.dart';

enum ChartPeriod { days, months }

class BalanceChartCubit extends Cubit<BalanceChartState> {
  BalanceChartCubit()
      : _allEntries = [],
        super(const BalanceChartState(period: ChartPeriod.days, entries: []));

  final List<BalanceEntry> _allEntries;
  ChartPeriod _currentPeriod = ChartPeriod.days;

  void updateEntries(List<BalanceEntry> newEntries) {
    _allEntries
      ..clear()
      ..addAll(newEntries);
    updatePeriod(_currentPeriod);
  }

  void updatePeriod(ChartPeriod period) {
    _currentPeriod = period;
    final filtered = _filterEntries(_allEntries, period);
    emit(BalanceChartState(period: period, entries: filtered));
  }

  List<BalanceEntry> _filterEntries(List<BalanceEntry> entries, ChartPeriod period) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (period == ChartPeriod.days) {
      final fromDate = today.subtract(const Duration(days: 29));

      final filtered = entries.where((entry) {
        final date = DateTime(entry.date.year, entry.date.month, entry.date.day);
        return date.isAfter(fromDate.subtract(const Duration(days: 1))) &&
            date.isBefore(today.add(const Duration(days: 1)));
      });

      final Map<DateTime, double> dailySums = {};

      for (var entry in filtered) {
        final date = DateTime(entry.date.year, entry.date.month, entry.date.day);
        dailySums[date] = (dailySums[date] ?? 0) + entry.amount;
      }

      return dailySums.entries
          .map((e) => BalanceEntry(date: e.key, amount: e.value))
          .toList()
        ..sort((a, b) => a.date.compareTo(b.date));
    } else {
      final Map<String, double> monthlySums = {};

      for (var entry in entries) {
        final key = DateFormat('yyyy-MM').format(entry.date);
        monthlySums[key] = (monthlySums[key] ?? 0) + entry.amount;
      }

      final currentMonthKey = DateFormat('yyyy-MM').format(now);

      final list = monthlySums.entries.map((e) {
        final parts = e.key.split('-');
        final year = int.parse(parts[0]);
        final month = int.parse(parts[1]);

        DateTime date;
        if (e.key == currentMonthKey) {
          date = DateTime(now.year, now.month, now.day);
        } else {
          final firstDayNextMonth =
          (month < 12) ? DateTime(year, month + 1, 1) : DateTime(year + 1, 1, 1);
          date = firstDayNextMonth.subtract(const Duration(days: 1));
        }

        return BalanceEntry(date: date, amount: e.value);
      }).toList()
        ..sort((a, b) => a.date.compareTo(b.date));

      return list;
    }
  }
}
