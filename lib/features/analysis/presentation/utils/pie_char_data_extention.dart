
import 'package:finance_hunter_app/features/analysis/data/model/grouped_transaction_model.dart';
import 'package:custom_fl_chart/custom_fl_chart.dart';

extension ToPieChartDataItem on GroupedTransactionModel {
  PieChartDataItem toPieItem() => PieChartDataItem(
    title: title,
    value: double.tryParse(amount) ?? 0,
    emoji: emoji,
  );
}