import 'package:agenda_flutter/repositorio/DaoSqLite.dart';
import 'package:agenda_flutter/repositorio/interfaceDao.dart';
import 'package:agenda_flutter/autenticacao/secureSession.dart'; 

import '../entidades/usuario.dart';

class Logincontroller {
  final DaoSqLite _dao = DaoSqLite();
  final SecureSession _session = SecureSession(); 

  Future<int> salvar(String nome, String senha) {
    Usuario login = Usuario(nome: nome, senha: senha);
    return _dao.addUser(login);
  }

  Future<bool> login(String nome, String senha) async {
    bool success = await _dao.login(nome, senha);
    if (success) {
      await _session.salvarToken(nome); // Agora usando secure storage
      return true;
    }
    return false;
  }

  void logout() async {
    await _session.logout();
  }
}