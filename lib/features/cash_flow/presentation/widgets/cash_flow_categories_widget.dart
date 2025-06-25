import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';

class CashFlowCategoriesWidget extends StatelessWidget {
  const CashFlowCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
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
              CustomListTile(
                title: s.total,
                backgroundColor: LightAppColors.secondaryBrandColor,
                child: CurrencyWidget(amount: transactionState.totalAmount),
              ),
              Expanded(
                child: TransactionListWidget(
                  transactions: transactionState.transactions,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
