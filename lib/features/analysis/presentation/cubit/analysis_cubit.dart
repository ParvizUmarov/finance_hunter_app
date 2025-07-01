import 'package:bloc/bloc.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/analysis/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/request/transaction_period_request_body.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/transaction_date_filter.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/transaction_kind.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_state.dart';

part 'analysis_cubit.freezed.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  final TransactionKind kind;
  final TransactionRepository repository;

  AnalysisCubit({required this.kind, required this.repository})
    : super(const AnalysisState.initial());

  double totalAmount = 0.0;
  DateTime selectedStartDateTime = TransactionDateFilter.defaultStartMonth();
  DateTime selectedEndDateTime = TransactionDateFilter.defaultEndTime();
  List<GroupedTransactionModel> groupedTransactionModels = [];

  Future<void> getGroupedTransactionByCategory([
    TransactionDateFilter? filter,
  ]) async {
    emit(AnalysisState.loading());

    _preparePeriod(filter);
    const accountId = 1;

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
          groupedTransactionModels = _groupedTransactions(response);
          emit(
            AnalysisState.success(
              groupedTransactions: groupedTransactionModels,
            ),
          );
        },
        onError: (message) {
          emit(AnalysisState.error(message: message.toString()));
        },
      ),
    );
  }

  List<TransactionModel> _filterTransactionsByKind(List<TransactionModel> all) {
    final isIncomeKind = kind is IncomeTransaction;
    return all.where((tx) => tx.category.isIncome == isIncomeKind).toList();
  }

  void _preparePeriod(TransactionDateFilter? filter) {
    if (filter?.startDate != null) {
      final newStart = filter!.startDateTime!;
      if (newStart.isAfter(selectedEndDateTime)) {
        selectedEndDateTime = newStart;
      }
      selectedStartDateTime = newStart;
    }

    if (filter?.endDate != null) {
      final newEnd = filter!.endDateTime!;
      if (newEnd.isBefore(selectedStartDateTime)) {
        selectedStartDateTime = newEnd;
      }
      selectedEndDateTime = newEnd;
    }
  }

  List<GroupedTransactionModel> _groupedTransactions(
    List<TransactionModel> transactions,
  ) {
    totalAmount = 0.0;
    final filteredTransactionModel = _filterTransactionsByKind(transactions);

    final Map<CategoryModel, List<TransactionModel>> groupedMap = {};

    for (final tx in filteredTransactionModel) {
      groupedMap.putIfAbsent(tx.category, () => []).add(tx);
    }

    final Map<CategoryModel, double> categorySums = {};
    for (final entry in groupedMap.entries) {
      final sum = entry.value.fold<double>(
        0.0,
        (total, tx) => total + (double.tryParse(tx.amount.trim()) ?? 0.0),
      );
      categorySums[entry.key] = sum;
      totalAmount += sum;
    }

    return groupedMap.entries.map((entry) {
      final category = entry.key;
      final transactions = entry.value;
      final transactionAmount = categorySums[category] ?? 0.0;

      final percent = totalAmount == 0
          ? 0
          : ((transactionAmount / totalAmount) * 100).toInt();

      return GroupedTransactionModel(
        id: category.id,
        amount: transactionAmount.toStringAsFixed(2),
        emoji: category.emoji,
        percent: percent.toString(),
        title: category.name,
        description: transactions.last.comment,
        category: category,
        transactions: transactions,
      );
    }).toList();
  }
}
