import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginSecureStorage {
  static final _storage = FlutterSecureStorage();
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';

  static Future setCredentials(String email, String password) async {
    print('Saving Email: $email');
    print('Saving Password: $password');
    await _storage.write(key: _keyEmail, value: email);
    await _storage.write(key: _keyPassword, value: password);
  }

  static Future<List<String?>> getCredentials() async {
    final email = await _storage.read(key: _keyEmail);
    final password = await _storage.read(key: _keyPassword);
    return [email, password];
  }

  static Future clearCredentials() async {
    await _storage.delete(key: _keyEmail);
    await _storage.delete(key: _keyPassword);
  }
}
