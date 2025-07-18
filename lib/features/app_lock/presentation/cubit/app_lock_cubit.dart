import 'dart:developer';

import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/app_lock/data/app_lock_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';

part 'app_lock_state.dart';

part 'app_lock_cubit.freezed.dart';

class AppLockCubit extends Cubit<AppLockState> {
  AppLockCubit({
    required SecureStorageService storageService,
    required LocalAuthentication localAuth,
  }) : _storageService = storageService,
       _localAuthentication = localAuth,
       super(
         AppLockState(
           enabledPinCode: false,
           status: InitialStatus(),
           errorMessage: null,
         ),
       );

  final SecureStorageService _storageService;
  String _pinCode = "";

  final LocalAuthentication _localAuthentication;

  Future<void> isLockScreenEnabled() async {
    final enabledPinCode = await _storageService.isPinCodeSet();
    emit(state.copyWith(enabledPinCode: enabledPinCode));
  }

  Future<void> entrance() async {
    final isEnabledPinCode = await _storageService.isPinCodeSet();

    if (isEnabledPinCode) {
      if (await _localAuthentication.isDeviceSupported()) {
        if (await _storageService.isBiometricEnabled()) {
          final isAuthenticate = await _localAuthentication.authenticate(
            localizedReason: "Please authenticate to use app",
            options: AuthenticationOptions(
              biometricOnly: true,
              useErrorDialogs: true,
              stickyAuth: false,
            ),
          );

          if (isAuthenticate) {
            emit(state.copyWith(status: CorrectPinCode()));
          }
        }
      }

      emit(state.copyWith(status: ConfirmPinCodeStatus()));
    }
  }

  Future<void> goToCreatePinCode() async {
    emit(state.copyWith(status: CreatePinCodeStatus()));
  }

  void goToEditPinCode() {
    emit(state.copyWith(status: EditPinCodeStatus()));
  }

  Future<void> creatingPinCode(String value) async {
    _pinCode = value;
    emit(state.copyWith(status: RetryPinCodeStatus()));
  }

  Future<void> editPinCode(String value) async {
    _pinCode = value;
    emit(state.copyWith(status: RetryPinCodeStatus()));
  }

  Future<void> retryPinCode(String value) async {
    if (_pinCode == value) {
      await _storageService.savePinCode(value);
      emit(state.copyWith(status: SavedPinCode()));
    } else {
      await _sendError("Пароли не совпадают. Повторите попытку.");
    }
  }

  Future<void> checkPinCode(String value) async {
    final isCorrect = await _storageService.verifyPinCode(value);

    if (isCorrect) {
      emit(state.copyWith(status: CorrectPinCode()));
    } else {
      await _sendError("Код-пароль не совпадает");
    }
  }

  Future<void> _sendError(String message) async {
    emit(state.copyWith(errorMessage: message));
    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(errorMessage: null));
  }
}
