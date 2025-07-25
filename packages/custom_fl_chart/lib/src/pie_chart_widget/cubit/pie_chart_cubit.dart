import 'package:custom_fl_chart/custom_fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pie_chart_state.dart';

class PieChartCubit extends Cubit<PieChartState> {
  PieChartCubit(List<PieChartDataItem> initialData)
      : super(PieChartState(
    oldData: initialData,
    currentData: initialData,
    isAnimating: false,
  ));

  void updateData(List<PieChartDataItem> newData) {
    if (_listEquals(state.currentData, newData) || state.isAnimating) return;

    emit(state.copyWith(
      oldData: state.currentData,
      currentData: newData,
      isAnimating: true,
    ));
  }

  void animationCompleted() {
    emit(state.copyWith(isAnimating: false));
  }

  bool _listEquals(List<PieChartDataItem> a, List<PieChartDataItem> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (!_itemEquals(a[i], b[i])) return false;
    }
    return true;
  }

  bool _itemEquals(PieChartDataItem a, PieChartDataItem b) {
    return a.title == b.title &&
        a.value == b.value &&
        a.color == b.color &&
        a.emoji == b.emoji;
  }
}


