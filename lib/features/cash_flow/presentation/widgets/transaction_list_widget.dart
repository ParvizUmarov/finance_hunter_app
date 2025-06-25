import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';

class TransactionListWidget extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionListWidget({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return CustomListTile(
          title: transaction.category.name,
          emoji: transaction.category.emoji,
          description: transaction.comment,
          addTrailing: true,
          child: CurrencyWidget(
            amount: transaction.amount,
          ),
        );
      },
    );
  }
}
