import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

class TransactionHistoryScreenBody extends StatelessWidget {
  const TransactionHistoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionState = context.watch<TransactionCubit>();
    final isLoading = transactionState.state is TransactionLoading;

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        if (context.mounted) {
          context.read<TransactionCubit>().getTransactionsForPeriod();
        }
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomListTile(
                  title: "Начало",
                  data: transactionState.formattedStartDateTime,
                  backgroundColor: LightAppColors.secondaryBrandColor,
                  onTap: isLoading
                      ? null
                      : () async {
                    await customShowDatePicker(
                      context: context,
                      initialDate:
                      transactionState.selectedStartDateTime,
                      onSelectedDate: (date) {
                        transactionState.getTransactionsForPeriod(
                          TransactionDateFilter(startDate: date),
                        );
                      },
                    );
                  },
                ),
                CustomListTile(
                  title: "Конец",
                  data: transactionState.formattedEndDateTime,
                  backgroundColor: LightAppColors.secondaryBrandColor,
                  onTap: isLoading
                      ? null
                      : () async {
                    await customShowDatePicker(
                      context: context,
                      initialDate: transactionState.selectedEndDateTime,
                      onSelectedDate: (date) {
                        transactionState.getTransactionsForPeriod(
                          TransactionDateFilter(endDate: date),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyHeaderDelegate(
              child: CustomListTile(
                title: "Сумма",
                backgroundColor: LightAppColors.secondaryBrandColor,
                child: CurrencyWidget(
                  amount: transactionState.amount ?? "-",
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomListTile(
              title: "Сортировка",
              data: transactionState.sortedType.label,
              backgroundColor: LightAppColors.secondaryBrandColor,
              onTap: isLoading
                  ? null
                  : () async {
                await showSortingBottomSheet(context, (
                    sortedType,
                    ) async {
                  await transactionState.applySorting(sortedType);
                });
              },
            ),
          ),
          TransactionHistoryList(transactionState: transactionState.state),
        ],
      ),
    );
  }
}
