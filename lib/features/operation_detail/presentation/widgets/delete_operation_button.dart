import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';

class DeleteOperationButton extends StatelessWidget {
  final TransactionKind kind;

  const DeleteOperationButton({
    super.key,
    required this.kind,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
        onPressed: () {
          context.pop();
        },
        child: Text(kind.operationDeleteButtonTitle(context)),
      ),
    );
  }
}
