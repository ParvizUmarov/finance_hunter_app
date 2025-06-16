import 'package:finance_hunter_app/core/core.dart';

class AccountScreen extends StatelessWidget {
  static const String screenName = "accountScreen";

  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мой счет"),
      ),
      body: Center(
        child: Text("Account Screen"),
      ),
    );
  }
}
