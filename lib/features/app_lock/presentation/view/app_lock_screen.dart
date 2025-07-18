
import 'package:finance_hunter_app/features/app_lock/data/app_lock_status.dart';
import 'package:finance_hunter_app/features/app_lock/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/settings/presentation/data/app_password_status.dart';

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

          if (state.status is SavedPinCode) {
            context.read<SettingsCubit>().togglePinCode(
              AppPasswordStatus.turnOn,
              context
            );
            WidgetsBinding.instance.addPostFrameCallback((_) {
              SettingsRoute().go(context);
            });
          }

          if (state.errorMessage != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              var snackBar = SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Theme.of(context).colorScheme.error,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
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
