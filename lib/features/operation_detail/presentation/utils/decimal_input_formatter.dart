import 'package:flutter/services.dart';

class DecimalInputFormatter extends TextInputFormatter {
  final String separator;
  final double maxAmount;

  DecimalInputFormatter(this.separator, {this.maxAmount = 99999999.99});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final value = newValue.text.replaceAll(separator, '.');

    if (value.isEmpty) {
      return newValue;
    }

    final double? number = double.tryParse(value);
    if (number != null && number <= maxAmount) {
      final parts = value.split('.');
      if (parts.length == 2 && parts[1].length > 2) {
        return oldValue;
      }
      return newValue;
    }

    return oldValue;
  }
}