import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';

class CategoryApiServiceImpl extends BaseApiService
    implements CategoryApiService {
  CategoryApiServiceImpl(super.dio);

  @override
  Future<void> getCategories({
    required Result<List<CategoryModel>> result,
  }) async {
    await safeRequest<List<CategoryModel>>(
      request: () async {
        final response = await dio.get('categories');
        return response.data;
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  @override
  Future<void> getCategoriesByType({
    required Result<List<CategoryModel>> result,
    required bool isIncome,
  }) async {
    await safeRequest<List<CategoryModel>>(
      request: () async {
        final response = await dio.get('categories/type/$isIncome');
        return response.data;
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }
}
