import 'package:drift/drift.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/core/core.dart';

class CategoryMapper {
  CategoryTbCompanion toTableData(CategoryModel model) => CategoryTbCompanion(
    id: Value(model.id),
    name: Value(model.name),
    emoji: Value(model.emoji),
    isIncome: Value(model.isIncome),
  );

  CategoryModel toModel(CategoryTbData data) {
    return CategoryModel(
      id: data.id,
      name: data.name,
      emoji: data.emoji,
      isIncome: data.isIncome,
    );
  }
}
