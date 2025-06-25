import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

Future<void> showSortingBottomSheet(
  BuildContext context,
  ValueChanged<SortedType> onSelectedSortingType,
) async {
  final s = S.of(context);
  final selected = await showModalBottomSheet<String>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(s.sortByDate),
            onTap: () => context.pop(SortedType.byDate.label),
          ),
          ListTile(
            title: Text(s.sortByAmount),
            onTap: () => context.pop(SortedType.byAmount.label),
          ),
          ListTile(
            title: Text(s.withoutSorting),
            onTap: () => context.pop(SortedType.none.label),
          ),
        ],
      );
    },
  );
  if (selected != null) {
    final selectedType = switch (selected) {
      "По дате" => SortedType.byDate,
      "По сумме" => SortedType.byAmount,
      String() => SortedType.none,
    };
    onSelectedSortingType(selectedType);
  }
}
