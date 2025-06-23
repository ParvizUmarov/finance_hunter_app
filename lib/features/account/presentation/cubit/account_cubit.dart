import 'package:bloc/bloc.dart';
import 'package:finance_hunter_app/features/account/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.dart';

part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  final BankAccountRepository _repository;

  AccountCubit({required BankAccountRepository repository})
    : _repository = repository,
      super(const AccountState.initial());

  Future<void> getAccounts() async {
    emit(AccountState.loading());

    try {
      final response = await _repository.getUserAccounts();
      emit(AccountState.success(accounts: response));
    } catch (e) {
      emit(AccountState.error(message: e.toString()));
    }
  }
}
