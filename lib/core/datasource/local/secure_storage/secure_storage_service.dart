import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  static const _keyPinCode = 'pin_code';
  static const _keyBiometricEnabled = 'biometric_enabled';
  static const _keyPinCodeEnabled = 'pin_code_enabled';

  Future<void> savePinCode(String pin) =>
      _storage.write(key: _keyPinCode, value: pin);

  Future<String?> getPinCode() => _storage.read(key: _keyPinCode);

  Future<void> deletePinCode() async {
    await _storage.delete(key: _keyPinCode);
    await _storage.delete(key: _keyPinCodeEnabled);
  }

  Future<bool> verifyPinCode(String input) async {
    final stored = await getPinCode();
    final enabled = await isPinCodeEnabled();
    return enabled && stored != null && stored == input;
  }

  Future<void> setPinCodeEnabled(bool enabled) =>
      _storage.write(key: _keyPinCodeEnabled, value: enabled.toString());

  Future<bool> isPinCodeEnabled() async {
    final value = await _storage.read(key: _keyPinCodeEnabled);
    return value == 'true';
  }

  Future<bool> isPinCodeSet() async {
    final code = await getPinCode();
    final enabled = await isPinCodeEnabled();
    return code != null && enabled;
  }

  Future<void> setBiometricEnabled(bool enabled) =>
      _storage.write(key: _keyBiometricEnabled, value: enabled.toString());

  Future<bool> isBiometricEnabled() async {
    final value = await _storage.read(key: _keyBiometricEnabled);
    return value == 'true';
  }

  Future<void> clearAll() => _storage.deleteAll();
}
