import 'package:finance_hunter_app/core/core.dart';

Future<void> customShowTimePicker({
  required BuildContext context,
  required TimeOfDay initialDate,
  required ValueChanged<TimeOfDay> onSelectedTime,
}) async {
  final selectedTime = await showTimePicker(
    context: context,
    initialTime: initialDate,
  );

  if (selectedTime != null) {
    onSelectedTime(selectedTime);
  }
}
