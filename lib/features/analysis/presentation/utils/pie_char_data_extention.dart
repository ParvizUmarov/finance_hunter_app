
import 'package:finance_hunter_app/features/analysis/data/model/grouped_transaction_model.dart';
import 'package:pie_chart_feature/pie_chart_feature.dart';

extension ToPieChartDataItem on GroupedTransactionModel {
  PieChartDataItem toPieItem() => PieChartDataItem(
    title: title,
    value: double.tryParse(amount) ?? 0,
    emoji: emoji,
  );
}