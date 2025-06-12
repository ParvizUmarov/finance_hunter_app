import 'package:finance_hunter_app/core/core.dart';

class MyExpensesScreen extends StatelessWidget {
  static const String screenName = "myExpensesScreen";

  const MyExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.myIncome),
      ),
      body: Center(
        child: Text("My expenses Screen"),
      ),
    );
  }
}
