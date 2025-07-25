import 'dart:math';

import 'package:custom_fl_chart/custom_fl_chart.dart';
import 'package:custom_fl_chart/src/widgets/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarChartWidget extends StatelessWidget {
  final List<BalanceEntry> entries;

  const BarChartWidget({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const SizedBox.shrink();
    }

    final minAmount = entries.map((e) => e.amount).reduce(min);
    final maxAmount = entries.map((e) => e.amount).reduce(max);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        child: BarChart(
          BarChartData(
            groupsSpace: 2,
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            alignment: BarChartAlignment.spaceEvenly,
            minY: minAmount > 0 ? 0 : minAmount * 1.2,
            maxY: maxAmount < 0 ? 0 : maxAmount * 1.2,
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  final entry = entries[groupIndex];
                  return BarTooltipItem(
                    '${DateFormat('dd.MM.yyyy').format(entry.date)}\n${entry.amount.toStringAsFixed(2)} ₽',
                    const TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    if (index < 0 || index >= entries.length) {
                      return const SizedBox();
                    }

                    final isFirst = index == 0;
                    final isMiddle = index == entries.length ~/ 2;
                    final isLast = index == entries.length - 1;

                    if (isFirst || isMiddle || isLast) {
                      final date = entries[index].date;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          DateFormat('dd.MM').format(date),
                          style: const TextStyle(fontSize: 10),
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            barGroups: List.generate(entries.length, (index) {
              final entry = entries[index];
              final isPositive = entry.amount >= 0;
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: entry.amount,
                    color: isPositive
                        ? AppColors.brandColor
                        : AppColors.negativeColor,
                    width: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}