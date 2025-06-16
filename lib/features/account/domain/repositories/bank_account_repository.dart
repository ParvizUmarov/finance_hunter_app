import 'package:finance_hunter_app/features/account/data/data.dart';
import '../models/bank_account/bank_account_model.dart';

abstract class BankAccountRepository {
  Future<List<BankAccountModel>> getUserAccounts();

  Future<BankAccountModel> updateAccount(
    int accountId,
    UpdateBankAccountRequestBody requestBody,
  );
}
