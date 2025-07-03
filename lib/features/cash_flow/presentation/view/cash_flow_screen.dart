import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';

class CashFlowScreen extends StatelessWidget {
  final TransactionKind kind;
  static const String expensesScreenName = "expensesScreen";
  static const String incomeScreenName = "incomeScreen";

  const CashFlowScreen({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    return OfflineAwareScaffold(
      appBar: CustomAppBar(
        title: kind.title(context),
        actionIcon: Icons.history,
        onActionPressed: () {
          TransactionHistoryRoute($extra: kind).push(context);
        },
      ),
      body: CashFlowCategoriesWidget(kind: kind,),
      floatingActionButton: CustomFloatingActionButton(
        onTap: () {
          kind.onFloatingButtonTap(context);
        },
      ),
    );
  }
}
