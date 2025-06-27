import 'package:bloc/bloc.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/account/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.dart';

part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  final BankAccountRepository _repository;

  AccountCubit({required BankAccountRepository repository})
    : _repository = repository,
      super(const AccountState.initial());

  List<BankAccountModel> _accounts = [];

  Future<void> getAccounts() async {
    emit(AccountState.loading());

    await _repository.getUserAccounts(
      result: Result(
        onSuccess: (response) {
          _accounts = response;
          if (_accounts.isEmpty) {
            emit(
              AccountState.success(
                account: BankAccountModel(
                  id: 1,
                  userId: 1,
                  name: "name",
                  balance: "-",
                  currency: "RUB",
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ),
              ),
            );
          } else {
            emit(AccountState.success(account: _accounts.first));
          }
        },
        onError: (message) {
          emit(AccountState.error(message: message.toString()));
        },
      ),
    );
  }

  void toggleBalanceVisibility() {
    final current = state;
    if (current is AccountSuccess) {
      emit(current.copyWith(isBalanceHidden: !current.isBalanceHidden));
    }
  }
}
