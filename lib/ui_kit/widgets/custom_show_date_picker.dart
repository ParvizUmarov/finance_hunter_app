
import 'package:finance_hunter_app/core/core.dart';

Future<void> customShowDatePicker({
  required BuildContext context,
  DateTime? initialDate,
  required ValueChanged<DateTime> onSelectedDate
}) async {
  final selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime.now(),
  );

  if(selectedDate != null){
    onSelectedDate(selectedDate);
  }
}

