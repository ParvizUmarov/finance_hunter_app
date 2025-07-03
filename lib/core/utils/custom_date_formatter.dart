import 'package:finance_hunter_app/core/core.dart';
import 'package:intl/intl.dart';

class CustomDateFormatter {
  const CustomDateFormatter._();

  static String formatDateTime(DateTime date){
    var inputFormat = DateFormat('HH:mm');
    return inputFormat.format(date);
  }

  static String formatTimeOfDay(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  static String formatDate(DateTime date){
    var inputFormat = DateFormat('dd.MM.yyyy');
    return inputFormat.format(date);
  }

  static String formatDateWithYearAndMonth(DateTime date) {
    return "${getMonthFromDateWithCapitalLetter(date.month)} ${date.year}";
  }

  static String formatDateWithYearAndMonth2(DateTime date) {
    return "${getMonthFromDateWithSmallLetter(date.month)} ${date.year}";
  }

  static String getMonthFromDateWithCapitalLetter(int month) {
    switch (month) {
      case 1:
        return 'Январь';
      case 2:
        return 'Февраль';
      case 3:
        return 'Март';
      case 4:
        return 'Апрель';
      case 5:
        return 'Май';
      case 6:
        return 'Июня';
      case 7:
        return 'Июля';
      case 8:
        return 'Августа';
      case 9:
        return 'Сентября';
      case 10:
        return 'Октября';
      case 11:
        return 'Ноября';
      case 12:
        return 'Декабря';
      default:
        return 'Январь';
    }
  }

  static String getMonthFromDateWithSmallLetter(int month) {
    switch (month) {
      case 1:
        return 'январь';
      case 2:
        return 'февраль';
      case 3:
        return 'март';
      case 4:
        return 'апрель';
      case 5:
        return 'май';
      case 6:
        return 'июнь';
      case 7:
        return 'июль';
      case 8:
        return 'август';
      case 9:
        return 'сентябрь';
      case 10:
        return 'октябрь';
      case 11:
        return 'ноябрь';
      case 12:
        return 'декабрь';
      default:
        return 'январь';
    }
  }
}
