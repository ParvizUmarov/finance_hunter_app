import 'dart:developer';

import 'package:finance_hunter_app/features/settings/presentation/utils/index.dart';

class SettingsScreen extends StatelessWidget {
  static const String screenName = "settingsScreen";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return OfflineAwareScaffold(
      appBar: CustomAppBar(title: s.settings),
      body: SettingsScreenBody(),
    );
  }
}
