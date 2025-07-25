part of 'bar_chart_cubit.dart';

class BalanceChartState extends Equatable {
  final ChartPeriod period;
  final List<BalanceEntry> entries;

  const BalanceChartState({
    required this.period,
    required this.entries,
  });

  @override
  List<Object> get props => [period, entries];
}
