

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart_feature/pie_chart_feature.dart';

import 'center_percent_box.dart';

class InteractivePieChart extends StatefulWidget {
  final List<PieChartDataItem> data;

  const InteractivePieChart({super.key, required this.data});

  @override
  State<InteractivePieChart> createState() => _InteractivePieChartState();
}

class _InteractivePieChartState extends State<InteractivePieChart> {
  int? touchedIndex;

  double get total => widget.data.fold(0, (sum, item) => sum + item.value);

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = widget.data.isEmpty;

    final data = isEmpty
        ? [
      PieChartDataItem(
        title: 'No data',
        value: 1,
        emoji: '🕳️',
        color: Colors.grey.shade300,
      ),
    ]
        : widget.data;

    final total = data.fold(0, (sum, item) => sum + item.value.toInt());

    return SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              centerSpaceRadius: 80,
              sectionsSpace: 2,
              sections: List.generate(data.length, (index) {
                final item = data[index];

                return PieChartSectionData(
                  value: item.value,
                  title: '',
                  color: item.color,
                  radius: 15,
                  showTitle: false,
                );
              }),
            ),
          ),
          ClipRect(
            child: CenterPercentBox(isEmpty: isEmpty, data: data, total: total),
          ),
        ],
      ),
    );
  }
}