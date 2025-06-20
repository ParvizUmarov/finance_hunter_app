import 'package:intl/intl.dart';

class CustomDateFormatter {
  const CustomDateFormatter._();

  static String formatDate(DateTime date){
    var inputFormat = DateFormat('HH:mm');
    return inputFormat.format(date);
  }

  static String formatDateWithYearAndMonth(DateTime date){
    return "${getMonthFromDateWithCapitalLetter(date.month)} ${date.year}";
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
}