import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class IRepositoryApi {
  final storage = new FlutterSecureStorage();
  final _keyToken = 'token';
  String token = '';

  final headers = {
    "content-type": "application/json",
    "accept": "application/json",
  };
  final String serverName = 'http://192.168.43.186:8081/api/';
  Future<String> hasToken() async {
    String value = await storage.read(key: _keyToken);
    if (value == null || value.isEmpty) {
      return '';
    }

    return value;
  }

  Future<void> saveToken(String token) async {
    await storage.write(key: _keyToken, value: token);
  }

  Future<void> removeToken() async {
    await storage.write(key: _keyToken, value: '');
  }

  get headersAuth async {
    if (token.isEmpty) {
      token = await storage.read(key: _keyToken);
    }
    return {
      "content-type": "application/json",
      "accept": "application/json",
      "Authorization": "Bearer  $token"
    };
  }
}
