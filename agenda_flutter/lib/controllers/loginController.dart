import 'package:agenda_flutter/repositorio/DaoSqLite.dart';
import 'package:agenda_flutter/autenticacao/secureStorage.dart'; 

import '../entidades/usuario.dart';

class Logincontroller {
  final DaoSqLite _dao = DaoSqLite();
  final SecureStorage _session = SecureStorage(); 

  Future<int> salvar(String nome, String senha) {
    Usuario login = Usuario(nome: nome, senha: senha);
    return _dao.addUser(login);
  }

  Future<bool> login(String nome, String senha) async {
    bool success = await _dao.login(nome, senha);
    if (success) {
      await _session.salvarToken(nome); 
      return true;
    }
    return false;
  }

  void logout() async {
    await _session.logout();
  }
}