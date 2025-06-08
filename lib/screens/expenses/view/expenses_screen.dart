import 'package:finance_hunter_app/core/core.dart';

class ExpensesScreen extends StatelessWidget {
  static const String screenName = "expensesScreen";
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Расходы сегодня",),
      ),
      body: Center(
        child: Text("Expenses Screen"),
      ),
    );
  }
}
