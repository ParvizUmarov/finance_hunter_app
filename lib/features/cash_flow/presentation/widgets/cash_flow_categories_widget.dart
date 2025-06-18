import '../utils/index.dart';

class CashFlowCategoriesWidget extends StatelessWidget {
  const CashFlowCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TransactionCubit>();

    return BlocStateBuilder<TransactionCubit, TransactionState>(
      cubit: cubit,
      whenState:
          ({
            required initial,
            required loading,
            required success,
            required error,
          }) {
            final state = cubit.state;
            return switch (state) {
              TransactionInitial() => initial(),
              TransactionLoading() => loading(),
              TransactionSuccess() => success(state),
              TransactionError(:final message) => error(message),
            };
          },
      onLoading: (ctx) => CustomShimmer(type: ShimmerType.categoriesList),
      onSuccess: (ctx, state) {
        final transactionState = state as TransactionSuccess;
        return RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
            cubit.getTransactionsForPeriod(TransactionDateFilter());
          },
          child: Column(
            children: [
              CategoriesListTile(
                title: "Всего",
                isTotalAmount: true,
                amount: "${transactionState.totalAmount} ₽",
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: transactionState.transactions.length,
                  itemBuilder: (context, index) {
                    final TransactionModel transaction =
                        transactionState.transactions[index];
                    return CategoriesListTile(
                      title: transaction.category.name,
                      amount: "${transaction.amount} ₽",
                      emoji: transaction.category.emoji,
                      description: transaction.comment,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
