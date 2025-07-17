import 'dart:developer';

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
  SortedType sortedType = SortedType.none;
  List<TransactionModel> transactions = [];

  String get formattedStartDateTime {
    if (selectedStartDateTime == null) return "-";
    return CustomDateFormatter.formatDateWithYearAndMonth(
      selectedStartDateTime!,
    );
  }

  String get formattedEndDateTime {
    if (selectedEndDateTime == null) return "-";
    return CustomDateFormatter.formatDateTime(selectedEndDateTime!);
  }

  Future<void> getTransactionsForPeriod([TransactionDateFilter? filter]) async {
    emit(TransactionState.loading());

    final int accountId = 1;
    _preparePeriod(filter);

    final periodRequest = TransactionPeriodRequestBody(
      accountId: accountId,
      startDate: selectedStartDateTime,
      endDate: selectedEndDateTime,
    );

    await repository.getTransactionByPeriod(
      accountId: accountId,
      requestBody: periodRequest,
      result: Result(
        onSuccess: (response) {
          transactions = _filterTransactionsByKind(response);
          transactions = _sortTransactions(sortedType, transactions);
          final total = _calculateTotalAmount(transactions);

          amount = total.toStringAsFixed(2);

          emit(
            TransactionState.success(
              transactions: transactions,
              totalAmount: amount!,
            ),
          );
        },
        onError: (message) {
          emit(TransactionState.error(message: message.toString()));
        },
      ),
    );
  }

  List<TransactionModel> _sortTransactions(
    SortedType type,
    List<TransactionModel> input,
  ) {
    final sorted = [...input];

    switch (type) {
      case SortedType.byDate:
        sorted.sort((a, b) => a.transactionDate.compareTo(b.transactionDate));
        break;
      case SortedType.byAmount:
        sorted.sort(
          (a, b) => (double.tryParse(a.amount) ?? 0.0).compareTo(
            double.tryParse(b.amount) ?? 0.0,
          ),
        );
        break;
      case SortedType.none:
        break;
    }

    sortedType = type;
    return sorted;
  }

  Future<void> applySorting(SortedType type) async {
    emit(TransactionState.loading());

    final sorted = _sortTransactions(type, transactions);

    emit(
      TransactionState.success(
        transactions: sorted,
        totalAmount: amount ?? "0",
      ),
    );
  }

  void _preparePeriod(TransactionDateFilter? filter) {
    selectedStartDateTime ??= TransactionDateFilter.defaultStartTime();
    selectedEndDateTime ??= TransactionDateFilter.defaultEndTime();

    if (filter?.startDate != null) {
      final newStart = filter!.startDateTime!;
      if (selectedEndDateTime != null &&
          newStart.isAfter(selectedEndDateTime!)) {
        selectedEndDateTime = newStart;
      }
      selectedStartDateTime = newStart;
    }

    if (filter?.endDate != null) {
      final newEnd = filter!.endDateTime!;
      if (selectedStartDateTime != null &&
          newEnd.isBefore(selectedStartDateTime!)) {
        selectedStartDateTime = newEnd;
      }
      selectedEndDateTime = newEnd;
    }
  }

  List<TransactionModel> _filterTransactionsByKind(List<TransactionModel> all) {
    final isIncomeKind = kind is IncomeTransaction;
    return all.where((tx) => tx.category.isIncome == isIncomeKind).toList();
  }

  double _calculateTotalAmount(List<TransactionModel> list) {
    return list.fold(
      0.0,
      (sum, tx) => sum + (double.tryParse(tx.amount) ?? 0.0),
    );
  }
}

enum SortedType {
  none,
  byDate,
  byAmount;

  String get label {
    switch (this) {
      case SortedType.byDate:
        return "По дате";
      case SortedType.byAmount:
        return "По сумме";
      default:
        return "Без сортировки";
    }
  }
}
