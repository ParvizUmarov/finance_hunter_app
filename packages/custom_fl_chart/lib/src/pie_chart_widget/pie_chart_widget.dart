import 'package:custom_fl_chart/custom_fl_chart.dart';
import 'package:custom_fl_chart/src/pie_chart_widget/interactive_pie_chart.dart';
import 'package:flutter/material.dart';

class CustomPieChartWidget extends StatefulWidget {
  final List<PieChartDataItem> data;

  const CustomPieChartWidget({super.key, required this.data});

  @override
  State<CustomPieChartWidget> createState() =>
      _AnimatedInteractivePieChartState();
}

class _AnimatedInteractivePieChartState extends State<CustomPieChartWidget>
    with TickerProviderStateMixin {
  late List<PieChartDataItem> _oldData;
  late List<PieChartDataItem> _currentData;

  late AnimationController _controller;
  late Animation<double> _rotation;
  late Animation<double> _fadeOut;
  late Animation<double> _fadeIn;

  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _currentData = widget.data;
    _oldData = widget.data;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _rotation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _fadeOut = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5)),
    );

    _fadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0)),
    );
  }

  @override
  void didUpdateWidget(covariant CustomPieChartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_isAnimating && !_listEquals(widget.data, _currentData)) {
      _oldData = _currentData;
      _currentData = widget.data;
      _startTransition();
    }
  }

  bool _listEquals(List<PieChartDataItem> a, List<PieChartDataItem> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (!_itemEquals(a[i], b[i])) return false;
    }
    return true;
  }

  bool _itemEquals(PieChartDataItem a, PieChartDataItem b) {
    return a.title == b.title &&
        a.value == b.value &&
        a.color == b.color &&
        a.emoji == b.emoji;
  }

  void _startTransition() {
    setState(() {
      _isAnimating = true;
    });

    _controller.forward(from: 0).whenComplete(() {
      setState(() {
        _isAnimating = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final rotationValue = _rotation.value * 2 * 3.1416; // 0..2π
        final showOld = _rotation.value < 0.5;

        return Transform.rotate(
          angle: rotationValue,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (showOld)
                Opacity(
                  opacity: _fadeOut.value,
                  child: InteractivePieChart(data: _oldData),
                ),
              if (!showOld)
                Opacity(
                  opacity: _fadeIn.value,
                  child: InteractivePieChart(data: _currentData),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
