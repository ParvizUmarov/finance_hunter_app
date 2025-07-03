import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/cash_flow/presentation/widgets/show_transaction_general_dialog.dart';

abstract class TransactionKind {
  String title(BuildContext context);

  String operationDetailTitle(BuildContext context);

  void onFloatingButtonTap(BuildContext context);
}

class IncomeTransaction extends TransactionKind {
  @override
  String title(BuildContext context) {
    final s = S.of(context);
    return s.incomeToday;
  }

  @override
  void onFloatingButtonTap(BuildContext context) {
    showOperationDetailDialog(context, this);
  }

  @override
  String operationDetailTitle(BuildContext context) {
    return "Мои доходы";
  }
}

class ExpensesTransaction extends TransactionKind {
  @override
  String title(BuildContext context) {
    final s = S.of(context);
    return s.expensesToday;
  }

  @override
  void onFloatingButtonTap(BuildContext context) {
    showOperationDetailDialog(context, this);
  }

  @override
  String operationDetailTitle(BuildContext context) {
    return "Мои расходы";
  }
}
