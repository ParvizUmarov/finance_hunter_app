import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/account/domain/models/bank_account/bank_account_model.dart';

class LocalAccountDatasourceImpl implements LocalAccountDataSource {
  final AppDatabase db;
  final AccountMapper mapper;

  LocalAccountDatasourceImpl({required this.db, required this.mapper});

  @override
  Future<void> cacheAccounts(List<BankAccountModel> bankAccounts) async {
    await db.batch((batch) {
      batch.insertAllOnConflictUpdate(
        db.accountTb,
        bankAccounts.map((a) => mapper.toTableData(a)).toList(),
      );
    });
  }

  @override
  Future<List<BankAccountModel>> getCachedAccounts() async {
    try {
      final rows = await db.select(db.accountTb).get();
      return rows.map((a) => mapper.toModel(a)).toList();
    } catch (e) {
      return [];
    }
  }
}
