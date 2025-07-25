part of 'pie_chart_cubit.dart';

class PieChartState {
  final List<PieChartDataItem> oldData;
  final List<PieChartDataItem> currentData;
  final bool isAnimating;

  PieChartState({
    required this.oldData,
    required this.currentData,
    required this.isAnimating,
  });

  PieChartState copyWith({
    List<PieChartDataItem>? oldData,
    List<PieChartDataItem>? currentData,
    bool? isAnimating,
  }) {
    return PieChartState(
      oldData: oldData ?? this.oldData,
      currentData: currentData ?? this.currentData,
      isAnimating: isAnimating ?? this.isAnimating,
    );
  }
}
