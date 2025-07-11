import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

class DateOnlyConverter implements JsonConverter<DateTime?, String?> {
  const DateOnlyConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null) return null;
    return DateTime.tryParse(json);
  }

  @override
  String? toJson(DateTime? date) {
    if (date == null) return null;
    return date.toIso8601String().split('T').first;
  }
}
