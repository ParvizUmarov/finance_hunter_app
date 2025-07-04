import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';

class LocalCategoryDatasourceImpl implements LocalCategoryDatasource {
  final AppDatabase db;
  final CategoryMapper mapper;

  LocalCategoryDatasourceImpl({required this.db, required this.mapper});

  @override
  Future<void> cacheCategories(List<CategoryModel> categories) async {
    await db.batch((batch) {
      batch.insertAllOnConflictUpdate(
        db.categoryTb,
        categories.map(mapper.toTableData).toList(),
      );
    });
  }

  @override
  Future<List<CategoryModel>> getCachedTransactions() async {
    final query = await db.select(db.categoryTb).get();
    return query.map((r) => mapper.toModel(r)).toList();
  }
}
