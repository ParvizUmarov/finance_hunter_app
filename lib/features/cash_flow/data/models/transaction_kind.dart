import 'package:finance_hunter_app/core/core.dart';

abstract class TransactionKind {
  String title(BuildContext context);

  void onFloatingButtonTap(BuildContext context);

  void onHistoryButtonTap(BuildContext context);
}

class IncomeTransaction extends TransactionKind {
  @override
  String title(BuildContext context) {
    final s = S.of(context);
    return s.incomeToday;
  }

  @override
  void onFloatingButtonTap(BuildContext context) {

  }

  @override
  void onHistoryButtonTap(BuildContext context) {
    TransactionHistoryRoute().push(context);
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
    const MyExpensesRoute().push(context);
  }

  @override
  void onHistoryButtonTap(BuildContext context) {
    TransactionHistoryRoute().push(context);
  }
}
