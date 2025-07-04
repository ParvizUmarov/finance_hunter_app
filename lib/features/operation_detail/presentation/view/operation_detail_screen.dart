import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';

class OperationDetailScreen extends StatefulWidget {
  static const String screenName = "operationDetailScreen";

  const OperationDetailScreen({
    super.key,
    required this.kind,
    this.transactionModel,
  });

  final TransactionKind kind;
  final TransactionModel? transactionModel;

  @override
  State<OperationDetailScreen> createState() => _OperationDetailScreenState();
}

class _OperationDetailScreenState extends State<OperationDetailScreen> {
  final TextEditingController amountController = TextEditingController();

  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<OperationDetailCubit>().init(
      widget.kind,
      widget.transactionModel,
    );

    commentController.addListener(() {
      context.read<OperationDetailCubit>().changeComment(commentController.text);
    });

    amountController.addListener(() {
      context.read<OperationDetailCubit>().changeAmount(amountController.text);
    });

  }

  @override
  Widget build(BuildContext context) {
    return OperationDetailWidget(
      kind: widget.kind,
      commentController: commentController,
      amountController: amountController,
    );
  }
}
