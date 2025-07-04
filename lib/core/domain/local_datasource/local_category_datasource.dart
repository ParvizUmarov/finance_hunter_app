import 'package:finance_hunter_app/features/app/presentation/utils/index.dart';

abstract interface class LocalCategoryDatasource {

  Future<void> cacheCategories(List<CategoryModel> categories);

  Future<List<CategoryModel>> getCachedTransactions();

}
