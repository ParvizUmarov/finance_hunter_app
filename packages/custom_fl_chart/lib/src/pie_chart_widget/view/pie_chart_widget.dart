import 'package:custom_fl_chart/custom_fl_chart.dart';
import 'package:custom_fl_chart/src/pie_chart_widget/cubit/pie_chart_cubit.dart';
import 'package:custom_fl_chart/src/pie_chart_widget/widgets/interactive_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPieChartWidget extends StatefulWidget {
  final List<PieChartDataItem> data;

  const CustomPieChartWidget({super.key, required this.data});

  @override
  State<CustomPieChartWidget> createState() => _CustomPieChartWidgetState();
}

class _CustomPieChartWidgetState extends State<CustomPieChartWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotation;
  late final Animation<double> _fadeOut;
  late final Animation<double> _fadeIn;

  late PieChartCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = PieChartCubit(widget.data);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _rotation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _fadeOut = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5)),
    );

    _fadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0)),
    );

    _controller.addListener(() => setState(() {}));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _cubit.animationCompleted();
      }
    });
  }

  @override
  void didUpdateWidget(covariant CustomPieChartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    _cubit.updateData(widget.data);

    if (!_controller.isAnimating && _cubit.state.isAnimating) {
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final rotationValue = _rotation.value * 2 * 3.141592653589793;
    final showOld = _rotation.value < 0.5;

    return BlocProvider.value(
      value: _cubit,
      child: Transform.rotate(
        angle: rotationValue,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (showOld)
              Opacity(
                opacity: _fadeOut.value,
                child: BlocBuilder<PieChartCubit, PieChartState>(
                  builder: (_, state) => InteractivePieChart(data: state.oldData),
                ),
              ),
            if (!showOld)
              Opacity(
                opacity: _fadeIn.value,
                child: BlocBuilder<PieChartCubit, PieChartState>(
                  builder: (_, state) => InteractivePieChart(data: state.currentData),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _cubit.close();
    super.dispose();
  }
}



