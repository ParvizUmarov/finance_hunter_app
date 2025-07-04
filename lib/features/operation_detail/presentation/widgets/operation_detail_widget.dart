import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';

class OperationDetailWidget extends StatelessWidget {
  const OperationDetailWidget({
    super.key,
    required this.kind,
    required this.commentController,
    required this.amountController,
  });

  final TransactionKind kind;
  final TextEditingController commentController;
  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return OfflineAwareScaffold(
      appBar: AppBar(
        title: Text(kind.operationDetailTitle(context)),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<OperationDetailCubit>().submit();
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: OperationDetailScreenBody(
        kind: kind,
        amountController: amountController,
        commentController: commentController,
      ),
    );
  }
}
