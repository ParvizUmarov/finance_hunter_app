import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

class TransactionHistoryTitle extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String amount;
  final Widget child;

  const TransactionHistoryTitle({super.key, required this.startTime, required this.endTime, required this.amount, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesListTile(
          title: "Начало",
          isTotalAmount: true,
          amount: startTime,
        ),
        CategoriesListTile(
          title: "Конец",
          isTotalAmount: true,
          amount: endTime,
        ),
        CategoriesListTile(
          title: "Сумма",
          isTotalAmount: true,
          amount: "$amount ₽",
        ),
        child
      ],
    );
  }
}
