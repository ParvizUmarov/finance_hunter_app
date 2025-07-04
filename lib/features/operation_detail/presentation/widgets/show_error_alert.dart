import 'package:finance_hunter_app/features/operation_detail/presentation/cubit/operation_detail_cubit.dart';
import 'package:finance_hunter_app/core/core.dart';

void showErrorAlert(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        actions: [
          FilledButton(
            onPressed: () {
              dialogContext.pop();
            },
            child: Text(
              "Понятно",
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.black),
            ),
          ),
        ],
        title: Text("Проверьте данные"),
        content: Text(message),
      );
    },
  ).whenComplete(() {
    if (context.mounted) {
      context.read<OperationDetailCubit>().cleanErrorState();
    }
  });
}
