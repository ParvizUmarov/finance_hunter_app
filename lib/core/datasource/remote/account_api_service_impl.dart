import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/account/data/models/request/update_bank_account_request_body.dart';
import 'package:finance_hunter_app/features/account/domain/models/bank_account/bank_account_model.dart';

class AccountApiServiceTestImpl extends BaseApiService
    implements AccountApiService {
  AccountApiServiceTestImpl(super.dio);

  @override
  Future<void> getUserBankAccount({
    required Result<List<BankAccountModel>> result,
  }) async {
    await safeRequest(
      request: () async {
        await Future.delayed(Duration(seconds: 2));
        return [_getTestDataModel()];
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  @override
  Future<void> updateUserBankAccount({
    required int accountId,
    required UpdateBankAccountRequestBody requestBody,
    required Result<BankAccountModel> result,
  }) async {
    await safeRequest<BankAccountModel>(
      request: () async {
        await Future.delayed(Duration(seconds: 2));
        return _getTestDataModel();
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  BankAccountModel _getTestDataModel() {
    return BankAccountModel(
      id: 151,
      userId: 151,
      name: "БОМЖ",
      balance: "1.00",
      currency: "RUB",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }


}
