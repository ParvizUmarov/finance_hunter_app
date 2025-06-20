part of 'transaction_cubit.dart';

@freezed
sealed class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = TransactionInitial;

  const factory TransactionState.loading() = TransactionLoading;

  const factory TransactionState.success({
    required List<TransactionModel> transactions,
    required String totalAmount,
  }) = TransactionSuccess;

  const factory TransactionState.error({
    required String message,
  }) = TransactionError;
}
