import '../../domain/domain.dart';

class CategoryRepositoryTestImpl implements CategoryRepository {
  @override
  Future<List<CategoryModel>> getListOfAllCategories() async {
    return [
      CategoryModel(
        id: 0,
        name: "Income category",
        emoji: "category emoji",
        isIncome: true,
      ),
      CategoryModel(
        id: 1,
        name: "Expenses category",
        emoji: "category emoji",
        isIncome: false,
      ),
      CategoryModel(
        id: 2,
        name: "Income category",
        emoji: "category emoji",
        isIncome: true,
      ),
    ];
  }

  @override
  Future<List<CategoryModel>> getListOfCategoryByType(bool isIncome) async {
    return [
      CategoryModel(
        id: 2,
        name: "Income category",
        emoji: "category emoji",
        isIncome: true,
      ),
      CategoryModel(
        id: 0,
        name: "Income category",
        emoji: "category emoji",
        isIncome: true,
      ),
    ];
  }
}