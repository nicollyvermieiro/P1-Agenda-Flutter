import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureSession {
  final _storage = FlutterSecureStorage();

  // Salva o token
  Future<void> salvarToken(String token) async {
    await _storage.write(key: 'session_token', value: token);
  }

  // Carrega o token
  Future<String?> carregarToken() async {
    return await _storage.read(key: 'session_token');
  }

  // Remove o token
  Future<void> logout() async {
    await _storage.delete(key: 'session_token');
  }
}