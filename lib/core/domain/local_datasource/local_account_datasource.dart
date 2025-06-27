import 'package:finance_hunter_app/features/account/domain/domain.dart';

abstract class LocalAccountDataSource {

  Future<void> cacheAccounts(List<BankAccountModel> bankAccounts);
  Future<List<BankAccountModel>> getCachedAccounts();

}
