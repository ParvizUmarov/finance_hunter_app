import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final TransactionKind kind;

  static const String screenName = "transactionHistoryScreen";

  const TransactionHistoryScreen({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final cubit = context.read<TransactionCubit>();

    return Scaffold(
      appBar: AppBar(title: Text(s.myHistory)),
      body: BlocStateBuilder<TransactionCubit, TransactionState>(
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
        onLoading: (_) => const CustomShimmer(type: ShimmerType.categoriesHistoryList),
        onSuccess: (context, state) {
          final transactionState = state as TransactionSuccess;
          return TransactionHistoryTitle(
            startTime: transactionState.startDate,
            endTime: transactionState.endDate,
            amount: transactionState.totalAmount,
            child: Expanded(
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
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
