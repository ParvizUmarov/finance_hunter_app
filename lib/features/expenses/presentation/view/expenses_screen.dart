import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/ui_kit/ui_kit.dart';

class ExpensesScreen extends StatelessWidget {
  static const String screenName = "expensesScreen";
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.expensesToday),
      ),
      body: Center(
        child: Text("Expenses Screen"),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onTap: () {
         const MyExpensesRoute().push(context);
        },
      ),
    );
  }
}
