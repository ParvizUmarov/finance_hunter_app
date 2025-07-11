import 'dart:developer';

import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';

import '../../domain/domain.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryApiService categoryApiService;
  final LocalCategoryDatasource localCategoryDb;

  CategoryRepositoryImpl({
    required this.categoryApiService,
    required this.localCategoryDb,
  });

  @override
  Future<void> getListOfAllCategories(
    Result<List<CategoryModel>> result,
  ) async {
    await categoryApiService.getCategories(
      result: Result(
        onSuccess: (response) async {
          await localCategoryDb.cacheCategories(response);
          result.onSuccess(response);
        },
        onError: (message) async {
          final categories = await localCategoryDb.getCachedTransactions();
          result.onSuccess(categories);
        },
      ),
    );
  }

  @override
  Future<void> getListOfCategoriesByType(
    bool isIncome,
    Result<List<CategoryModel>> result,
  ) async {
    await categoryApiService.getCategoriesByType(
      result: Result(
        onSuccess: (response) async {
          await localCategoryDb.cacheCategories(response);
          result.onSuccess(response);
        },
        onError: (message) async {
          log("error category: $message");
          final categories = await localCategoryDb.getCachedTransactions();
          result.onSuccess(categories);
        },
      ),
      isIncome: isIncome,
    );
  }
}
