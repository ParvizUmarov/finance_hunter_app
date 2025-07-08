import 'dart:convert';

import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';

class CategoryApiServiceImpl extends BaseApiService
    implements CategoryApiService {
  CategoryApiServiceImpl(super.dio);

  @override
  Future<void> getCategories({
    required Result<List<CategoryModel>> result,
  }) async {
    await safeRequest(
      request: () async {
        final response = await dio.get('categories');
        final List data = response.data as List;
        return data.map((e) => CategoryModel.fromJson(e)).toList();
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }
}