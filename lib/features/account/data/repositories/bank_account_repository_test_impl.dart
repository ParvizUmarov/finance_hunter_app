import 'dart:developer';

import 'package:finance_hunter_app/core/core.dart';

import '../../domain/domain.dart';
import '../data.dart';

class BankAccountRepositoryImpl implements BankAccountRepository {
  final AccountApiService accountApiService;
  final LocalAccountDataSource localDb;
  final IDataBase iDataBase;

  BankAccountRepositoryImpl({
    required this.accountApiService,
    required this.localDb,
    required this.iDataBase,
  });

  @override
  Future<void> getUserAccounts({
    required Result<List<BankAccountModel>> result,
  }) async {
    await accountApiService.getUserBankAccount(
      result: Result(
        onSuccess: (response) async {
          await localDb.cacheAccounts(response);
          result.onSuccess(response);
        },
        onError: (message) async {
          log("error message=$message");
          final response = await localDb.getCachedAccounts();
          result.onSuccess(response);
          //result.onError(message);
        },
      ),
    );
  }

  @override
  Future<void> updateAccount({
    required Result<BankAccountModel> result,
    required int accountId,
    required UpdateBankAccountRequestBody requestBody,
  }) async {
    await accountApiService.updateUserBankAccount(
      accountId: accountId,
      requestBody: requestBody,
      result: Result(
        onSuccess: (response) {
          result.onSuccess(response);
        },
        onError: (message) {
          result.onError(message);
        },
      ),
    );
  }

  @override
  Future<void> changeCurrency({required String currencyIcon}) async {
    await iDataBase.set<String>(KeyStore.currency, currencyIcon);
  }

  @override
  Future<String> getCurrentCurrency() async {
    return await iDataBase.get<String>(KeyStore.currency, Currency.rub.icon);
  }
}
