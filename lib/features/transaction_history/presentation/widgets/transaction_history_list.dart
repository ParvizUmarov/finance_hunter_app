import 'package:finance_hunter_app/features/cash_flow/presentation/widgets/show_transaction_general_dialog.dart';
import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

class TransactionHistoryList extends StatelessWidget {
  final TransactionState transactionState;
  final TransactionKind kind;

  const TransactionHistoryList({
    super.key,
    required this.transactionState,
    required this.kind,
  });

  @override
  Widget build(BuildContext context) {
    if (transactionState is TransactionLoading) {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: CustomShimmer(type: ShimmerType.categoriesList),
        ),
      );
    } else if (transactionState is TransactionSuccess) {
      final successState = transactionState as TransactionSuccess;
      if (successState.transactions.isEmpty) {
        return SliverToBoxAdapter(child: EmptyTransactionWidget());
      }
      return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final TransactionModel transaction = successState.transactions[index];
          return CustomListTile(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            title: transaction.category.name,
            emoji: transaction.category.emoji,
            subTrailing: CustomDateFormatter.formatDateTime(
              transaction.createdAt,
            ),
            addTrailing: true,
            description: transaction.comment,
            child: CurrencyWidget(amount: transaction.amount),
            onTap: () {
              showOperationDetailDialog(
                context: context,
                kind: kind,
                transactionModel: transaction,
                onRefresh: () async {
                  await context
                      .read<TransactionCubit>()
                      .getTransactionsForPeriod();
                },
              );
            },
          );
        }, childCount: successState.transactions.length),
      );
    } else if (transactionState is TransactionError) {
      final error = transactionState as TransactionError;
      return SliverToBoxAdapter(
        child: ErrorBaseWidget(errorMessage: error.message),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
