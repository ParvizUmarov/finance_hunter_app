import 'package:finance_hunter_app/features/transaction_history/presentation/utils/index.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final TransactionKind kind;
  static const String screenName = "transactionHistoryScreen";

  const TransactionHistoryScreen({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return OfflineAwareScaffold(
      appBar: AppBar(
        title: Text(s.myHistory),
        actions: [
          IconButton(
            onPressed: () {
              AnalysisRoute($extra: kind).push(context);
            },
            icon: SvgPicture.asset(Assets.icons.icAnalyze),
          ),
        ],
      ),
      body: TransactionHistoryScreenBody(kind: kind),
    );
  }
}
