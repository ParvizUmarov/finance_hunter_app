import 'package:finance_hunter_app/features/cash_flow/data/models/transaction_kind.dart';
import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';

class OperationDetailScreen extends StatelessWidget {
  static const String screenName = "operationDetailScreen";

  const OperationDetailScreen({super.key, required this.kind});

  final TransactionKind kind;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kind.operationDetailTitle(context)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.check)
          ),
        ],
      ),
      body: OperationDetailScreenBody(),
    );
  }
}
