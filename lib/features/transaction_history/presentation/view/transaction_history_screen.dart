import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final TransactionKind kind;

  static const String screenName = "transactionHistoryScreen";

  const TransactionHistoryScreen({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(s.myHistory)),
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          final transactionState = context.watch<TransactionCubit>();
          return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
              if (context.mounted) {
                context.read<TransactionCubit>().getTransactionsForPeriod(
                  TransactionDateFilter(),
                );
              }
            },
            child: Column(
              children: [
                CategoriesListTile(
                  title: "Начало",
                  isTotalAmount: true,
                  amount: transactionState.startDateTime ?? "-",
                ),
                CategoriesListTile(
                  title: "Конец",
                  isTotalAmount: true,
                  amount: transactionState.endDateTime ?? "-",
                ),
                CategoriesListTile(
                  title: "Сумма",
                  isTotalAmount: true,
                  amount: "${transactionState.amount ?? "-"} ₽",
                ),
                Expanded(
                  child: TransactionHistoryList(transactionState: state),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
