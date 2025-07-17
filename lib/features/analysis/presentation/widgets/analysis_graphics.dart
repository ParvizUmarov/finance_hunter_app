import 'dart:developer';

import 'package:finance_hunter_app/features/analysis/presentation/utils/index.dart';

class AnalysisGraphics extends StatelessWidget {
  const AnalysisGraphics({super.key});

  @override
  Widget build(BuildContext context) {
    final groupedTransactionModels = context
        .watch<AnalysisCubit>()
        .groupedTransactionModels;
    final List<PieChartDataItem> pieItems = groupedTransactionModels
        .map((item) => item.toPieItem())
        .toList();

    return CustomPieChartWidget(data: pieItems);
  }
}
