part of 'app_lock_cubit.dart';

@freezed
abstract class AppLockState with _$AppLockState {
  const factory AppLockState({
    required bool enabledPinCode,
    required AppLockStatus status,
    required String? errorMessage
  }) = _AppLockState;
}