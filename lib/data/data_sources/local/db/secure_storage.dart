import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _secureStorage;

  const SecureStorage(this._secureStorage);

  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }
}
