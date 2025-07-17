import 'dart:developer';

import 'package:finance_hunter_app/features/app_lock/data/app_lock_status.dart';
import 'package:finance_hunter_app/features/app_lock/presentation/utils/index.dart';

class AppLockScreen extends StatelessWidget {
  static const String screenName = "appLockScreen";

  const AppLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AppLockCubit, AppLockState>(
        listener: (context, state) {
          if (state.status is CorrectPinCode) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ExpensesRoute().go(context);
            });
          }

          if(state.status is SavedPinCode){
            WidgetsBinding.instance.addPostFrameCallback((_) {
              SettingsRoute().go(context);
            });
          }

          if (state.errorMessage != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {});
          }
        },
        builder: (context, state) {
          return AppLockScreenBody(
            appLockStatus: state.status,
            errorMessage: state.errorMessage,
          );
        },
      ),
    );
  }
}
