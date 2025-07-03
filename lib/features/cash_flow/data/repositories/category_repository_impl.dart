import 'package:finance_hunter_app/core/data/models/result.dart';
import 'package:finance_hunter_app/core/domain/api_services/category_api_service.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';

import '../../domain/domain.dart';

class CategoryRepositoryTestImpl implements CategoryRepository {
  final CategoryApiService categoryApiService;

  CategoryRepositoryTestImpl({required this.categoryApiService});

  @override
  Future<void> getListOfAllCategories(
    Result<List<CategoryModel>> result,
  ) async {
    await categoryApiService.getCategories(result: result);
  }
}
