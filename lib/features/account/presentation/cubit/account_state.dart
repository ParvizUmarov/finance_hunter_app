part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = AccountInitial;

  const factory AccountState.loading() = AccountLoading;

  const factory AccountState.success({
    required BankAccountModel account,
    required List<TransactionModel> transactions,
    @Default(true) bool isBalanceHidden,
  }) = AccountSuccess;

  const factory AccountState.error({required String message}) = AccountError;
}
