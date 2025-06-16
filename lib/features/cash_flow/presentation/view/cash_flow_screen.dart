import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';

class CashFlowScreen extends StatelessWidget {
  final TransactionKind kind;
  static const String expensesScreenName = "expensesScreen";
  static const String incomeScreenName = "incomeScreen";

  const CashFlowScreen({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(kind.title(context)),
        actions: [
          IconButton(
            onPressed: () {
              kind.onHistoryButtonTap(context);
            },
            icon: Icon(Icons.history),
          ),
        ],
      ),
      body: Center(
        child: Text(kind.title(context)),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onTap: () {
          kind.onFloatingButtonTap(context);
        },
      ),
    );
  }
}
