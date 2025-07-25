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

  static final List<Color> _allowedColors = [
    Color(0xFFFCE300),
    Color(0xFF2AE881),
  ];

  static Color _generateColor(String key) {
    if (_colorCache.containsKey(key)) {
      return _colorCache[key]!;
    }

    final random = Random(key.hashCode);

    if (_colorCache.length < _allowedColors.length) {
      final color = _allowedColors[_colorCache.length];
      _colorCache[key] = color;
      return color;
    }

    final color = Color.fromARGB(
      255,
      100 + random.nextInt(156),
      100 + random.nextInt(156),
      100 + random.nextInt(156),
    );

    _colorCache[key] = color;
    return color;
  }
}
