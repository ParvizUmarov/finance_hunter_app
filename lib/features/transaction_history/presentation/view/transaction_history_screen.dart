import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final TransactionKind kind;
  static const String screenName = "transactionHistoryScreen";

  const TransactionHistoryScreen({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final transactionState = context.watch<TransactionCubit>();
    final isLoading = transactionState.state is TransactionLoading;

    return Scaffold(
      appBar: AppBar(title: Text(s.myHistory)),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          if (context.mounted) {
            context.read<TransactionCubit>().getTransactionsForPeriod();
          }
        },
        child: Column(
          children: [
            CustomListTile(
              title: "Начало",
              amount: transactionState.formattedStartDateTime,
              backgroundColor: LightAppColors.secondaryBrandColor,
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
              title: "Конец",
              amount: transactionState.formattedEndDateTime,
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
            CustomListTile(
              title: "Сумма",
              amount: "${transactionState.amount ?? "-"} ₽",
              backgroundColor: LightAppColors.secondaryBrandColor,
            ),
            Expanded(
              child: TransactionHistoryList(
                transactionState: transactionState.state,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
