import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

class TransactionHistoryScreenBody extends StatelessWidget {
  final TransactionKind kind;

  const TransactionHistoryScreenBody({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final transactionState = context.watch<TransactionCubit>();
    final isLoading = transactionState.state is TransactionLoading;

    final customListTilePadding = EdgeInsets.symmetric(
      vertical: 2,
      horizontal: 16,
    );

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
                  padding: customListTilePadding,
                  title: s.beginning,
                  data: transactionState.formattedStartDateTime,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  onTap: isLoading
                      ? null
                      : () async {
                          await customShowDatePicker(
                            context: context,
                            initialDate: transactionState.selectedStartDateTime,
                            onSelectedDate: (date) {
                              transactionState.getTransactionsForPeriod(
                                TransactionDateFilter(startDate: date),
                              );
                            },
                          );
                        },
                ),
                CustomListTile(
                  title: s.end,
                  padding: customListTilePadding,
                  data: transactionState.formattedEndDateTime,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
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
                padding: customListTilePadding,
                title: s.amount,
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                child: CurrencyWidget(amount: transactionState.amount ?? "-"),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomListTile(
              padding: customListTilePadding,
              title: s.sorting,
              data: transactionState.sortedType.label,
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              onTap: isLoading
                  ? null
                  : () async {
                      await showSortingBottomSheet(context, (sortedType) async {
                        await transactionState.applySorting(sortedType);
                      });
                    },
            ),
          ),
          TransactionHistoryList(
            transactionState: transactionState.state,
            kind: kind,
          ),
        ],
      ),
    );
  }
}
