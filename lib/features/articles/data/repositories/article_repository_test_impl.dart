import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/domain.dart';

class ArticleRepositoryTestImpl implements ArticleRepository {
  final CategoryApiService categoryApiService;

  ArticleRepositoryTestImpl({required this.categoryApiService});

  @override
  Future<void> getMyArticles(Result<List<CategoryModel>> result) async {
    await categoryApiService.getCategories(result: result);
  }
}
