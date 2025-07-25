import 'dart:developer';

import 'package:custom_fl_chart/src/bar_chart_widget/cubit/bar_chart_cubit.dart';
import 'package:custom_fl_chart/src/bar_chart_widget/data/balance_entry.dart';
import 'package:custom_fl_chart/src/bar_chart_widget/widget/bar_chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarChartWithSegmentedControl extends StatefulWidget {
  final List<BalanceEntry> entries;

  const BarChartWithSegmentedControl({super.key, required this.entries});

  @override
  State<BarChartWithSegmentedControl> createState() => _BarChartWithSegmentedControlState();
}

class _BarChartWithSegmentedControlState extends State<BarChartWithSegmentedControl> {
  late final BalanceChartCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BalanceChartCubit();
    _cubit.updateEntries(widget.entries);
  }

  @override
  void didUpdateWidget(covariant BarChartWithSegmentedControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.entries != widget.entries) {
      _cubit.updateEntries(widget.entries);
    }
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: const _ChartView(),
    );
  }
}

class _ChartView extends StatelessWidget {
  const _ChartView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceChartCubit, BalanceChartState>(
      builder: (context, state) {
        return Column(
          children: [
            state.entries.isEmpty
                ? const SizedBox.shrink()
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CupertinoSegmentedControl<ChartPeriod>(
                groupValue: state.period,
                children: const {
                  ChartPeriod.days: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Дни'),
                  ),
                  ChartPeriod.months: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Месяцы'),
                  ),
                },
                onValueChanged: (value) {
                  context.read<BalanceChartCubit>().updatePeriod(value);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  child: state.entries.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : BarChartWidget(
                    key: ValueKey(state.period),
                    entries: state.entries,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
