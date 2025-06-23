import '../../domain/domain.dart';
import '../data.dart';

class BankAccountRepositoryTestImpl implements BankAccountRepository {
  @override
  Future<List<BankAccountModel>> getUserAccounts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [_getTestDataModel()];
  }

  @override
  Future<BankAccountModel> updateAccount(
    int accountId,
    UpdateBankAccountRequestBody requestBody,
  ) async {
    return _getTestDataModel();
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
