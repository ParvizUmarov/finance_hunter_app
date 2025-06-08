import 'package:finance_hunter_app/core/core.dart';

class IncomeScreen extends StatelessWidget {
  static const String screenName = "incomeScreen";

  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Доходы сегодня"),
      ),
      body: const Center(
        child: Text("Income Screen"),
      ),
    );
  }
}
