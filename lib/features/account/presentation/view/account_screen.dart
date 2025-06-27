import 'package:finance_hunter_app/features/account/presentation/utils/index.dart';

class AccountScreen extends StatelessWidget {
  static const String screenName = "accountScreen";

  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return OfflineAwareScaffold(
      appBar: CustomAppBar(title: s.myAccount),
      body: AccountViewBody(),
    );
  }
}
