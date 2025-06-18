import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';

part 'transaction_state.dart';

part 'transaction_cubit.freezed.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionKind kind;
  final TransactionRepository repository;

  TransactionCubit({required this.kind, required this.repository})
    : super(const TransactionState.initial());

  String? amount;
  String? startDateTime;
  String? endDateTime;

  Future<void> getTransactionsForPeriod(TransactionDateFilter filter) async {
    emit(TransactionState.loading());
    try {
      final accountId = 1;
      final periodRequest = TransactionPeriodRequestBody(
        accountId: accountId,
        startDate: filter.startDateTime,
        endDate: filter.endDateTime,
      );

      final allTransactions = await repository.getTransactionByPeriod(
        accountId,
        periodRequest,
      );

      final isIncomeKind = kind is IncomeTransaction;

      final filteredTransactions = allTransactions
          .where((tx) => tx.category.isIncome == isIncomeKind)
          .toList();

      final totalAmount = filteredTransactions.fold(
        0.0,
        (sum, tx) => sum + (double.tryParse(tx.amount) ?? 0.0),
      );

      startDateTime = filter.getFormatedStartDateTime();
      endDateTime = filter.getFormatedEndDateTime();
      amount = totalAmount.toString();

      emit(
        TransactionState.success(
          transactions: filteredTransactions,
          totalAmount: totalAmount.toString(),
          startDate: filter.getFormatedStartDateTime(),
          endDate: filter.getFormatedEndDateTime(),
        ),
      );
    } catch (e) {
      emit(TransactionState.error(message: e.toString()));
    }
  }
}
