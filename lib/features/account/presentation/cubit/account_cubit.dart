import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:finance_hunter_app/features/analysis/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/app/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/models/transaction/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.dart';

part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  final BankAccountRepository _bankAccountRepository;
  final TransactionRepository _transactionRepository;

  AccountCubit({
    required BankAccountRepository repository,
    required TransactionRepository transactionRepository,
  }) : _bankAccountRepository = repository,
       _transactionRepository = transactionRepository,
       super(const AccountState.initial());

  List<BankAccountModel> _accounts = [];
  DateTime startDateTime = TransactionDateFilter.defaultStartMonth();
  DateTime endDateTime = TransactionDateFilter.defaultEndTime();
  List<TransactionModel> _transactionResponse = [];

  Future<void> getAccounts() async {
    emit(AccountState.loading());

    await _bankAccountRepository.getUserAccounts(
      result: Result(
        onSuccess: (response) async {

          log("success response: $response");
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
                transactions: _transactionResponse,
              ),
            );
          } else {
            emit(
              AccountState.success(
                account: _accounts.first,
                transactions: _transactionResponse,
              ),
            );
          }
          await _getTransactionForMonth();
        },
        onError: (message) {
          emit(AccountState.error(message: message.toString()));
        },
      ),
    );
  }

  Future<void> _getTransactionForMonth() async {
    const int accountId = 1;
    final requestBody = TransactionPeriodRequestBody(
      accountId: accountId,
      startDate: startDateTime,
      endDate: endDateTime,
    );

    await _transactionRepository.getTransactionByPeriod(
      accountId: accountId,
      requestBody: requestBody,
      result: Result(
        onSuccess: (response) {
          _transactionResponse = response;
          emit(
            AccountState.success(
              account: _accounts.first,
              transactions: _transactionResponse,
            ),
          );
        },
        onError: (message) {},
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
