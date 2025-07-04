import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';

class DeleteOperationButton extends StatelessWidget {
  final TransactionKind kind;
  final bool isSaving;
  final TransactionModel? transaction;

  const DeleteOperationButton({
    super.key,
    required this.kind,
    required this.isSaving,
    this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
        onPressed: isSaving
            ? null
            : () async {
                await context.read<OperationDetailCubit>().delete(
                  transaction,
                );
              },
        child: isSaving
            ? Center(child: CircularProgressIndicator(color: Colors.white))
            : Text(kind.operationDeleteButtonTitle(context)),
      ),
    );
  }
}
