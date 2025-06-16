import '../models/models.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getListOfAllCategories();

  Future<List<CategoryModel>> getListOfCategoryByType(bool isIncome);
}
