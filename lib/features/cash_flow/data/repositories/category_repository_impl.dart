import '../../domain/domain.dart';

class CategoryRepositoryTestImpl implements CategoryRepository {
  @override
  Future<List<CategoryModel>> getListOfAllCategories() async {
    return await _getListOfMockData();
  }

  @override
  Future<List<CategoryModel>> getListOfCategoryByType(bool isIncome) async {
    final result = await _getListOfMockData();
    return result.where((c) => c.isIncome == isIncome).toList();
  }

  Future<List<CategoryModel>> _getListOfMockData() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      CategoryModel(
        id: 0,
        name: "Зарплата",
        emoji: "💰",
        isIncome: true,
      ),
      CategoryModel(
        id: 1,
        name: "Фриланс",
        emoji: "💻",
        isIncome: true,
      ),
      CategoryModel(
        id: 2,
        name: "Зарплата",
        emoji: "🎁",
        isIncome: true,
      ),
      CategoryModel(
        id: 3,
        name: "Подарки",
        emoji: "💰",
        isIncome: true,
      ),
      CategoryModel(
        id: 4,
        name: "Продукты",
        emoji: "🍎",
        isIncome: false,
      ),
      CategoryModel(
        id: 5,
        name: "Транспорт",
        emoji: "🚗",
        isIncome: false,
      ),
      CategoryModel(
        id: 6,
        name: "Проценты по вкладам",
        emoji: "🏦",
        isIncome: true,
      ),
      CategoryModel(
        id: 7,
        name: "Возврат долга",
        emoji: "🔄",
        isIncome: true,
      ),

      CategoryModel(
        id: 8,
        name: "Путешествия",
        emoji: "✈️",
        isIncome: false,
      ),
      CategoryModel(
        id: 9,
        name: "Подписки",
        emoji: "📺",
        isIncome: false,
      ),

      CategoryModel(
        id: 10,
        name: "Хобби",
        emoji: "🎨️",
        isIncome: false,
      ),
      CategoryModel(
        id: 11,
        name: "Кредиты",
        emoji: "💳",
        isIncome: false,
      ),
      CategoryModel(
        id: 12,
        name: "Красота",
        emoji: "💄",
        isIncome: true,
      ),
      CategoryModel(
        id: 13,
        name: "Спорт",
        emoji: "🏋️",
        isIncome: false,
      ),
    ];
  }
}