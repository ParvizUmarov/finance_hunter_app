part of 'analysis_cubit.dart';

@freezed
class AnalysisState with _$AnalysisState {
  const factory AnalysisState.initial() = AnalysisInitial;

  const factory AnalysisState.loading() = AnalysisLoading;

  const factory AnalysisState.success({
    required List<GroupedTransactionModel> groupedTransactions,
  }) = AnalysisSuccess;

  const factory AnalysisState.error({required String message}) = AnalysisError;
}
