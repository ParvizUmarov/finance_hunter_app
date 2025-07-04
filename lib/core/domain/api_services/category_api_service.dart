import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';

abstract interface class CategoryApiService {
  Future<void> getCategories({required Result<List<CategoryModel>> result});
}
