import 'package:finance_hunter_app/features/articles/domain/domain.dart';

abstract interface class ArticleRepository {

  Future<List<ArticleModel>> getMyArticles();

}