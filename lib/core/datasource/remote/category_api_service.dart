import 'dart:convert';

import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';

class CategoryApiServiceTestImpl extends BaseApiService
    implements CategoryApiService {
  CategoryApiServiceTestImpl(super.dio);

  @override
  Future<void> getCategories({
    required Result<List<CategoryModel>> result,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    await safeRequest<List<CategoryModel>>(
      request: () async {
        final List<dynamic> jsonList = jsonDecode(_mockData);
        return jsonList.map((c) => CategoryModel.fromJson(c)).toList();
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  final String _mockData = """
  [
  {
    "id": 1,
    "name": "Зарплата",
    "emoji": "💰",
    "isIncome": true
  },
  {
    "id": 2,
    "name": "Фриланс",
    "emoji": "💻",
    "isIncome": true
  },
  {
    "id": 3,
    "name": "Подарки",
    "emoji": "🎁",
    "isIncome": true
  },
  {
    "id": 4,
    "name": "Проценты по вкладам",
    "emoji": "🏦",
    "isIncome": true
  },
  {
    "id": 5,
    "name": "Возврат долга",
    "emoji": "🔄",
    "isIncome": true
  },
  {
    "id": 6,
    "name": "Продажа имущества",
    "emoji": "🏠",
    "isIncome": true
  },
  {
    "id": 7,
    "name": "Жильё",
    "emoji": "🏠",
    "isIncome": false
  },
  {
    "id": 8,
    "name": "Продукты",
    "emoji": "🍎",
    "isIncome": false
  },
  {
    "id": 9,
    "name": "Транспорт",
    "emoji": "🚗",
    "isIncome": false
  },
  {
    "id": 10,
    "name": "Развлечения",
    "emoji": "🎭",
    "isIncome": false
  },
  {
    "id": 11,
    "name": "Рестораны",
    "emoji": "🍽️",
    "isIncome": false
  },
  {
    "id": 12,
    "name": "Одежда",
    "emoji": "👕",
    "isIncome": false
  },
  {
    "id": 13,
    "name": "Здоровье",
    "emoji": "🏥",
    "isIncome": false
  },
  {
    "id": 14,
    "name": "Коммунальные услуги",
    "emoji": "💡",
    "isIncome": false
  },
  {
    "id": 15,
    "name": "Техника",
    "emoji": "📱",
    "isIncome": false
  },
  {
    "id": 16,
    "name": "Образование",
    "emoji": "📚",
    "isIncome": false
  },
  {
    "id": 17,
    "name": "Путешествия",
    "emoji": "✈️",
    "isIncome": false
  },
  {
    "id": 18,
    "name": "Подписки",
    "emoji": "📺",
    "isIncome": false
  },
  {
    "id": 19,
    "name": "Подарки",
    "emoji": "🎀",
    "isIncome": false
  },
  {
    "id": 20,
    "name": "Красота",
    "emoji": "💄",
    "isIncome": false
  },
  {
    "id": 21,
    "name": "Спорт",
    "emoji": "🏋️",
    "isIncome": false
  },
  {
    "id": 22,
    "name": "Домашние животные",
    "emoji": "🐾",
    "isIncome": false
  },
  {
    "id": 23,
    "name": "Хобби",
    "emoji": "🎨",
    "isIncome": false
  },
  {
    "id": 24,
    "name": "Кредиты",
    "emoji": "💳",
    "isIncome": false
  }
]
  """;
}
