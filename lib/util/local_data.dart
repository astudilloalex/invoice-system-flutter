import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalData {
  const LocalData({
    this.secureStorage = const FlutterSecureStorage(),
  });

  final FlutterSecureStorage secureStorage;

  static String? _token;

  Future<String?> getToken() async {
    return _token ?? await secureStorage.read(key: 'token');
  }

  Future<void> setToken(String? token) {
    _token = token == null ? null : 'Bearer $token';
    return secureStorage.write(key: 'token', value: _token);
  }
}
