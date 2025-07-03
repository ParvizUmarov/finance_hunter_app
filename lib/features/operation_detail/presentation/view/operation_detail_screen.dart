import 'package:finance_hunter_app/features/app/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';
import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';

class OperationDetailScreen extends StatelessWidget {
  static const String screenName = "operationDetailScreen";

  OperationDetailScreen({super.key, required this.kind, this.transactionModel});

  final TransactionKind kind;
  final TransactionModel? transactionModel;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = OperationDetailCubit(
          kind,
          transactionRepository: context.read<TransactionRepository>(),
          categoryRepository: context.read<CategoryRepository>(),
          bankAccountRepository: context.read<BankAccountRepository>(),
        );

        if (transactionModel == null) {
          cubit.create();
        } else {
          cubit.edit(transactionModel!);
        }

        cubit.initData();

        return cubit;
      },
      child: OperationDetailWidget(
        kind: kind,
        commentController: commentController,
        amountController: amountController,
      ),
    );
  }
}
