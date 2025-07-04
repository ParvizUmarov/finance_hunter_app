import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/operation_detail/presentation/view/operation_detail_screen.dart';

void showOperationDetailDialog({
  required BuildContext context,
  required TransactionKind kind,
  required Function() onRefresh,
  TransactionModel? transactionModel,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    useRootNavigator: true,
    barrierColor: Colors.black.withValues(alpha: 0.4),
    barrierLabel: kind.operationDetailTitle(context),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return OperationDetailScreen(
        kind: kind,
        transactionModel: transactionModel,
        onSuccess: onRefresh,
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
