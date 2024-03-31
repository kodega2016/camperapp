import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _tokenKey = 'token';

  final FlutterSecureStorage _secureStorage;
  UserSecureStorage({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? FlutterSecureStorage();

  Future<void> upsertUser({
    String? name,
    required String email,
    String? token,
  }) async {
    await Future.wait([
      _secureStorage.write(key: _emailKey, value: email),
      if (name != null) _secureStorage.write(key: _nameKey, value: name),
      if (token != null) _secureStorage.write(key: _tokenKey, value: token),
    ]);
  }

  Future<void> deleteUser() async {
    await Future.wait([
      _secureStorage.delete(key: _nameKey),
      _secureStorage.delete(key: _emailKey),
      _secureStorage.delete(key: _tokenKey),
    ]);
  }

  Future<String?> getName() async => _secureStorage.read(key: _nameKey);
  Future<String?> getEmail() async => _secureStorage.read(key: _emailKey);
  Future<String?> getToken() async => _secureStorage.read(key: _tokenKey);
}
