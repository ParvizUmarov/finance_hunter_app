import 'dart:math';
import 'dart:ui';

class PieChartDataItem {
  final String title;
  final double value;
  final String emoji;
  final Color color;

  PieChartDataItem({
    required this.title,
    required this.value,
    required this.emoji,
    Color? color,
  }) : color = color ?? _generateColor(title);

  static final Map<String, Color> _colorCache = {};

  static Color _generateColor(String key) {
    if (_colorCache.containsKey(key)) {
      return _colorCache[key]!;
    }

    final random = Random(key.hashCode);
    final color = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );

    _colorCache[key] = color;
    return color;
  }
}
