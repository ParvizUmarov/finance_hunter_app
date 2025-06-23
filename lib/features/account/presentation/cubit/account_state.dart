part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = AccountInitial;

  const factory AccountState.loading() = AccountLoading;

  const factory AccountState.success({
    required List<BankAccountModel> accounts,
  }) = AccountSuccess;

  const factory AccountState.error({required String message}) = AccountError;
}
