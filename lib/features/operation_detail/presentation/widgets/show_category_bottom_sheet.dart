import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';

Future<void> showCategoryBottomSheet(
    BuildContext context,
    ValueChanged<CategoryModel> onSelect,
    List<CategoryModel> categories,
    CategoryModel? selectedCategory,
    ) async {
  final selected = await showModalBottomSheet<CategoryModel>(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        snap: true,
        expand: false,
        initialChildSize: 0.5,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (_, controller) {
          return ListView(
            controller: controller,
            children: categories
                .map(
                  (category) => ListTile(
                leading: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Center(child: Text(category.emoji)),
                ),
                title: Text(category.name),
                onTap: () => context.pop(category),
              ),
            )
                .toList(),
          );
        },
      );
    },
  );
  if (selected != null) {
    onSelect(selected);
  }
}