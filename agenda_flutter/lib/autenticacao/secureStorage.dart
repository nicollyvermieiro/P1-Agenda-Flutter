import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = FlutterSecureStorage();

  Future<void> salvarToken(String token) async {
    await storage.write(key: 'auth_token', value: token);
  }

  Future<String?> carregarToken() async {
    return await storage.read(key: 'auth_token');
  }

  Future<bool> estaLogado() async {
    final token = await carregarToken();
    return token != null;
  }

  Future<void> removerToken() async {
    await storage.delete(key: 'auth_token');
  }

  Future<void> limparTudo() async {
    await storage.deleteAll();
  }

  Future<void> login(String token) async {
    await salvarToken(token);

    Future<void> logout() async {
      await removerToken();
    }
  }
}