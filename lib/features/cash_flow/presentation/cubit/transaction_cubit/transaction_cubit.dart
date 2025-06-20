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
  DateTime? selectedStartDateTime;
  DateTime? selectedEndDateTime;

  String get formattedStartDateTime {
    if (selectedStartDateTime == null) return "-";
    return CustomDateFormatter.formatDateWithYearAndMonth(selectedStartDateTime!);
  }

  String get formattedEndDateTime {
    if (selectedEndDateTime == null) return "-";
    return CustomDateFormatter.formatDate(selectedEndDateTime!);
  }

  Future<void> getTransactionsForPeriod([TransactionDateFilter? filter]) async {
    emit(TransactionState.loading());
    try {
      selectedStartDateTime ??= TransactionDateFilter.defaultStartTime();
      selectedEndDateTime ??= TransactionDateFilter.defaultEndTime();

      validateStartDateTime(filter);
      validateEndDateTime(filter);

      final accountId = 1;
      final periodRequest = TransactionPeriodRequestBody(
        accountId: accountId,
        startDate: selectedStartDateTime,
        endDate: selectedEndDateTime,
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

      amount = totalAmount.toString();

      emit(
        TransactionState.success(
          transactions: filteredTransactions,
          totalAmount: totalAmount.toString(),
        ),
      );
    } catch (e) {
      emit(TransactionState.error(message: e.toString()));
    }
  }

  void validateStartDateTime(TransactionDateFilter? filter) {
    if (filter?.startDate != null) {
      final newStart = filter!.startDateTime!;
      if (selectedEndDateTime != null && newStart.isAfter(selectedEndDateTime!)) {
        selectedEndDateTime = newStart;
      }
      selectedStartDateTime = newStart;
    }
  }

  void validateEndDateTime(TransactionDateFilter? filter){
    if (filter?.endDate != null) {
      final newEnd = filter!.endDateTime!;
      if (selectedStartDateTime != null && newEnd.isBefore(selectedStartDateTime!)) {
        selectedStartDateTime = newEnd;
      }
      selectedEndDateTime = newEnd;
    }
  }
}
