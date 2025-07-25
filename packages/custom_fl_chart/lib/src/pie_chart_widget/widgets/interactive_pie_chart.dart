import 'package:custom_fl_chart/custom_fl_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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

              pieTouchData: PieTouchData(
                touchCallback: (event, response) {
                  if (!event.isInterestedForInteractions ||
                      response == null ||
                      response.touchedSection == null) {
                    setState(() => touchedIndex = null);
                    return;
                  }

                  setState(() {
                    if (!(response.touchedSection!.touchedSectionIndex < 0)) {
                      touchedIndex =
                          response.touchedSection!.touchedSectionIndex;
                    }
                  });
                },
              ),
            ),
          ),
          if (touchedIndex != null && touchedIndex! < data.length)
            Positioned(
              bottom: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${data[touchedIndex!].emoji} ${data[touchedIndex!].title}: ${data[touchedIndex!].value.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
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
