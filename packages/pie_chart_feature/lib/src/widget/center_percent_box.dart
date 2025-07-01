import 'package:flutter/material.dart';
import 'package:pie_chart_feature/pie_chart_feature.dart';

class CenterPercentBox extends StatelessWidget {
  final bool isEmpty;
  final List<PieChartDataItem> data;
  final int total;

  const CenterPercentBox({
    super.key,
    required this.isEmpty,
    required this.data,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Center(
        child: isEmpty
            ? Text(
                'Нет данных',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: data.map((item) {
                  final percent = (item.value * 100 / total).toStringAsFixed(2);
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "$percent%",
                        style: TextStyle(fontSize: 7),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 7),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
      ),
    );
  }
}
