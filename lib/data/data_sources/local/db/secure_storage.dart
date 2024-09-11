import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _secureStorage;

  const SecureStorage(this._secureStorage);

  Future<String?> read(String key) async {
    return _secureStorage.read(key: key);
  }

  Future<bool> write(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete(String key) async {
    await _secureStorage.delete(key: key);
    final result = await _secureStorage.read(key: key);
    return result == null;
  }
}
