import '../../domain/domain.dart';
import '../data.dart';

class BankAccountRepositoryTestImpl implements BankAccountRepository {

  @override
  Future<List<BankAccountModel>> getUserAccounts() async {
      return [
        _getTestDataModel(1),
        _getTestDataModel(2),
        _getTestDataModel(3),
      ];
  }

  @override
  Future<BankAccountModel> updateAccount(int accountId,
      UpdateBankAccountRequestBody requestBody,) async {
    return _getTestDataModel(0);
  }

  BankAccountModel _getTestDataModel(int id) {
    return BankAccountModel(
        id: id,
        userId: 0,
        name: "BankAccount$id",
        balance: "1000",
        currency: "RUB",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
  }
}
