import 'package:finance_hunter_app/features/detail_category/presentation/utils/index.dart';

class DetailCategoryBody extends StatelessWidget {
  final GroupedTransactionModel transactionModel;

  const DetailCategoryBody({super.key, required this.transactionModel});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        CustomListTile(
          title: s.total,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          child: CurrencyWidget(
            amount: transactionModel.amount,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: transactionModel.transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactionModel.transactions[index];
              return CustomListTile(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                title: transaction.category.name,
                emoji: transaction.category.emoji,
                subTrailing: CustomDateFormatter.formatDateTime(transaction.createdAt),
                addTrailing: true,
                description: transaction.comment,
                child: CurrencyWidget(amount: transaction.amount),
              );
            },
          ),
        ),
      ],
    );
  }
}
