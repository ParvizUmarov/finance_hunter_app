import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';

class TransactionListWidget extends StatelessWidget {
  final List<TransactionModel> transactions;
  final TransactionKind kind;

  const TransactionListWidget({
    super.key,
    required this.transactions,
    required this.kind,
  });

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
          onTap: () {
            showOperationDetailDialog(
              context: context,
              kind: kind,
              transactionModel: transaction,
            );
          },
          child: CurrencyWidget(amount: transaction.amount),
        );
      },
    );
  }
}
