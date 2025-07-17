import 'dart:ui';

import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/app_lock/presentation/cubit/app_lock_cubit.dart';

abstract class AppLockStatus {
  String get title => "";

  String get text => "";

  Future<void> onConfirm(BuildContext context, String value);
}

class InitialStatus extends AppLockStatus {
  @override
  Future<void> onConfirm(BuildContext context, String value) async {}
}

class CreatePinCodeStatus extends AppLockStatus {
  @override
  String get title => "Создание код-пароля";

  @override
  String get text =>
      "Введите 4 цифры, которые хотите использовать для разблакировки приложения.";

  @override
  Future<void> onConfirm(BuildContext context, String value) async {
    await context.read<AppLockCubit>().creatingPinCode(value);
  }
}

class RetryPinCodeStatus extends AppLockStatus {
  @override
  String get title => "Повторите код-пароль";

  @override
  String get text => "Повторите введённый ранее код для подтверждения.";

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
  String get title => "Введите код-пароль";

  @override
  String get text => "Введите свой 4-значный код для доступа к приложению.";

  @override
  Future<void> onConfirm(BuildContext context, String value) async {
    await context.read<AppLockCubit>().checkPinCode(value);
  }
}

class CorrectPinCode extends AppLockStatus {

  @override
  Future<void> onConfirm(BuildContext context, String value) async {}
}


