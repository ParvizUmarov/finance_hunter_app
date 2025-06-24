import 'package:finance_hunter_app/features/analysis/presentation/utils/index.dart';

class AnalysisScreenBody extends StatelessWidget {
  const AnalysisScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          title: "Период: начало",
          child: DateTimeContainer(date: DateTime.now()),
        ),
        CustomListTile(
          title: "Период: конец",
          child: DateTimeContainer(date: DateTime.now()),
        ),
        CustomListTile(
          title: "Сумма",
          child: CurrencyWidget(amount: "123 865"),
        ),
        AnalysisGraphics(),

      ],
    );
  }
}
