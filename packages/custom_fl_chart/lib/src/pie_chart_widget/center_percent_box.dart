import 'package:custom_fl_chart/custom_fl_chart.dart';
import 'package:flutter/material.dart';

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
    final maxItems = 5;
    final visibleItems = data.take(maxItems).toList();
    final hasMore = data.length > maxItems;

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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...visibleItems.map((item) {
                    final percent = (item.value * 100 / total).toStringAsFixed(
                      2,
                    );
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: item.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text("$percent%", style: const TextStyle(fontSize: 7)),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 7),
                          ),
                        ),
                      ],
                    );
                  }),
                  if (hasMore)
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text("…", style: TextStyle(fontSize: 7)),
                    ),
                ],
              ),
      ),
    );
  }
}
