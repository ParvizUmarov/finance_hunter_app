import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/account/data/models/request/update_bank_account_request_body.dart';
import 'package:finance_hunter_app/features/account/domain/domain.dart';

abstract interface class AccountApiService {
  Future<void> getUserBankAccount({
    required Result<List<BankAccountModel>> result,
  });

  Future<void> updateUserBankAccount({
    required int accountId,
    required UpdateBankAccountRequestBody requestBody,
    required Result<BankAccountModel> result,
  });
}
