import 'package:finance_hunter_app/core/core.dart';

class TransactionHistoryScreen extends StatelessWidget {
  static const String screenName = "transactionHistoryScreen";
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.myHistory),
      ),
    );
  }
}
