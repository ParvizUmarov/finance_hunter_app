import 'package:finance_hunter_app/core/data/models/result.dart';
import 'package:finance_hunter_app/features/articles/domain/domain.dart';

abstract interface class ArticleRepository {

  Future<void> getMyArticles(Result<List<CategoryModel>> result);

}