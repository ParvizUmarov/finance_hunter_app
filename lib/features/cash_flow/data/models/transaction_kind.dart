import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/cash_flow/presentation/cubit/transaction_cubit/transaction_cubit.dart';
import 'package:finance_hunter_app/features/cash_flow/presentation/widgets/show_transaction_general_dialog.dart';

abstract class TransactionKind {
  String title(BuildContext context);

  String operationDetailTitle(BuildContext context);

  String operationDeleteButtonTitle(BuildContext context);

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
    showOperationDetailDialog(
      context: context,
      kind: this,
      onRefresh: () async {
        await context.read<TransactionCubit>().getTransactionsForPeriod();
      },
    );
  }

  @override
  String operationDetailTitle(BuildContext context) {
    return "Мои доходы";
  }

  @override
  String operationDeleteButtonTitle(BuildContext context) {
    return "Удалить доходы";
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
    showOperationDetailDialog(
      context: context,
      kind: this,
      onRefresh: () async {
        await context.read<TransactionCubit>().getTransactionsForPeriod();
      },
    );
  }

  @override
  String operationDetailTitle(BuildContext context) {
    return "Мои расходы";
  }

  @override
  String operationDeleteButtonTitle(BuildContext context) {
    return "Удалить расходы";
  }
}
