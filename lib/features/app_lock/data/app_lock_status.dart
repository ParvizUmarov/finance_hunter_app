import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/app_lock/presentation/cubit/app_lock_cubit.dart';

abstract class AppLockStatus {
  String title(BuildContext context) => "";

  String text(BuildContext context) => "";

  Future<void> onConfirm(BuildContext context, String value);
}

class InitialStatus extends AppLockStatus {
  @override
  Future<void> onConfirm(BuildContext context, String value) async {}
}

class CreatePinCodeStatus extends AppLockStatus {
  @override
  String title(BuildContext context) => S.of(context).createPassword;

  @override
  String text(BuildContext context) =>
      S.of(context).enterFourDigitsToCreatePassword;

  @override
  Future<void> onConfirm(BuildContext context, String value) async {
    await context.read<AppLockCubit>().creatingPinCode(value);
  }
}

class EditPinCodeStatus extends AppLockStatus {
  @override
  String title(BuildContext context) => S.of(context).editPasscode;

  @override
  String text(BuildContext context) =>
      S.of(context).enterFourDigitsToCreatePassword;

  @override
  Future<void> onConfirm(BuildContext context, String value) async {
    await context.read<AppLockCubit>().editPinCode(value);
  }
}

class RetryPinCodeStatus extends AppLockStatus {
  @override
  String title(BuildContext context) => S.of(context).repeatPasscode;

  @override
  String text(BuildContext context) => S.of(context).repeatPasscodeToConfirm;

  @override
  Future<void> onConfirm(BuildContext context, String value) async {
    await context.read<AppLockCubit>().retryPinCode(value);
  }
}

class SavedPinCode extends AppLockStatus {
  @override
  Future<void> onConfirm(BuildContext context, String value) async {}
}

class ConfirmPinCodeStatus extends AppLockStatus {
  @override
  String title(BuildContext context) => S.of(context).enterPasscode;

  @override
  String text(BuildContext context) => S.of(context).enterPasscodeToAccessApp;

  @override
  Future<void> onConfirm(BuildContext context, String value) async {
    await context.read<AppLockCubit>().checkPinCode(value);
  }
}

class CorrectPinCode extends AppLockStatus {
  @override
  Future<void> onConfirm(BuildContext context, String value) async {}
}
