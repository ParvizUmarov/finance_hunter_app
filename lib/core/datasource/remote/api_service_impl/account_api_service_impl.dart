import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/account/data/models/request/update_bank_account_request_body.dart';
import 'package:finance_hunter_app/features/account/domain/models/bank_account/bank_account_model.dart';

class AccountApiServiceImpl extends BaseApiService
    implements AccountApiService {
  AccountApiServiceImpl(super.dio);

  @override
  Future<void> getUserBankAccount({
    required Result<List<BankAccountModel>> result,
  }) async {
    await safeRequest<List<BankAccountModel>>(
      request: () async {
        final response = await dio.get('accounts');
        return response.data;
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
        final response = await dio.put(
          'accounts/$accountId',
          data: requestBody.toJson(),
        );
        return response.data;
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }
}
