import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  static const _keyPinCode = 'pin_code';
  static const _keyBiometricEnabled = 'biometric_enabled';

  Future<void> savePinCode(String pin) =>
      _storage.write(key: _keyPinCode, value: pin);

  Future<String?> getPinCode() =>
      _storage.read(key: _keyPinCode);

  Future<void> deletePinCode() =>
      _storage.delete(key: _keyPinCode);

  Future<bool> verifyPinCode(String input) async {
    final stored = await getPinCode();
    return stored != null && stored == input;
  }

  Future<bool> isPinCodeSet() async =>
      (await getPinCode()) != null;

  Future<void> setBiometricEnabled(bool enabled) =>
      _storage.write(key: _keyBiometricEnabled, value: enabled.toString());

  Future<bool> isBiometricEnabled() async {
    final value = await _storage.read(key: _keyBiometricEnabled);
    return value == 'true';
  }

  Future<void> clearAll() => _storage.deleteAll();
}
