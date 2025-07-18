import 'package:finance_hunter_app/features/operation_detail/presentation/cubit/operation_detail_cubit.dart';
import 'package:finance_hunter_app/core/core.dart';

void showErrorAlert(BuildContext context, String message) {
  final s = S.of(context);
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
              s.ok,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.black),
            ),
          ),
        ],
        title: Text(s.checkData),
        content: Text(message),
      );
    },
  ).whenComplete(() {
    if (context.mounted) {
      context.read<OperationDetailCubit>().cleanErrorState();
    }
  });
}
