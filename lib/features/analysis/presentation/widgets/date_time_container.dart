import 'package:finance_hunter_app/features/analysis/presentation/utils/index.dart';

class DateTimeContainer extends StatelessWidget {
  final DateTime date;

  const DateTimeContainer({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        CustomDateFormatter.formatDateWithYearAndMonth2(date),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: LightAppColors.onSurface
        ),
      ),
    );
  }
}
