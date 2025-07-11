import 'package:finance_hunter_app/core/data/models/result.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';

abstract class CategoryRepository {
  Future<void> getListOfAllCategories(Result<List<CategoryModel>> result);

  Future<void> getListOfCategoriesByType(
    bool isIncome,
    Result<List<CategoryModel>> result,
  );
}
