import 'dart:math';
import 'dart:ui';

final Map<String, Color> _categoryColorCache = {};

Color getColorForTitle(String title) {
  if (_categoryColorCache.containsKey(title)) {
    return _categoryColorCache[title]!;
  }

  final random = Random(title.hashCode);
  final color = Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );

  _categoryColorCache[title] = color;
  return color;
}
