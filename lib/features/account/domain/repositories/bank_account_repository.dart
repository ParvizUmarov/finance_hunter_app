import 'package:finance_hunter_app/core/data/models/result.dart';
import 'package:finance_hunter_app/features/account/data/data.dart';
import '../models/bank_account/bank_account_model.dart';

abstract class BankAccountRepository {

  Future<void> getUserAccounts({
    required Result<List<BankAccountModel>> result,
  });

  Future<void> updateAccount({
    required Result<BankAccountModel> result,
    required int accountId,
    required UpdateBankAccountRequestBody requestBody,
  });

  Future<void> changeCurrency({
    required String currencyIcon,
  });

  Future<String> getCurrentCurrency();
}
