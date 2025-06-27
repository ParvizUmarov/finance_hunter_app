
import 'package:finance_hunter_app/features/articles/domain/domain.dart';

class ArticleRepositoryTestImpl implements ArticleRepository {
  
  @override
  Future<List<ArticleModel>> getMyArticles() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      ArticleModel(
        id: 0,
        name: "Аренда квартиры",
        emoji: "💰",
      ),
      ArticleModel(
        id: 1,
        name: "Одежда",
        emoji: "💻",
      ),
      ArticleModel(
        id: 2,
        name: "На собачку",
        emoji: "🎁",
      ),
      ArticleModel(
        id: 3,
        name: "На собачку",
        emoji: "💰",
      ),
      ArticleModel(
        id: 4,
        name: "Ремонт квартиры",
        emoji: "РК",
      ),
      ArticleModel(
        id: 5,
        name: "Продукты",
        emoji: "🚗",
      ),
      ArticleModel(
        id: 6,
        name: "Проценты по вкладам",
        emoji: "🏦",
      ),
      ArticleModel(
        id: 7,
        name: "Продукты",
        emoji: "🍎",
      ),

      ArticleModel(
        id: 8,
        name: "Спортзал",
        emoji: "✈️",
      ),
      ArticleModel(
        id: 9,
        name: "Медицина",
        emoji: "📺",
      ),
    ];
  }
}