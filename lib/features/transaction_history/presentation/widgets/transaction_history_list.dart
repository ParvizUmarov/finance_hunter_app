import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

class TransactionHistoryList extends StatelessWidget {
  final TransactionState transactionState;

  const TransactionHistoryList({super.key, required this.transactionState});

  @override
  Widget build(BuildContext context) {
    if (transactionState is TransactionLoading) {
      return CustomShimmer(type: ShimmerType.categoriesList);
    } else if (transactionState is TransactionSuccess) {
      final successState = transactionState as TransactionSuccess;
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: successState.transactions.length,
        itemBuilder: (context, index) {
          final TransactionModel transaction = successState.transactions[index];
          return CategoriesListTile(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            title: transaction.category.name,
            amount: "${transaction.amount} ₽",
            emoji: transaction.category.emoji,
            transactionDate: CustomDateFormatter.formatDate(
              transaction.createdAt,
            ),
            description: transaction.comment,
          );
        },
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
