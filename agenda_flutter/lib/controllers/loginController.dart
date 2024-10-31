import 'dart:ffi';

import 'package:agenda_flutter/autenticacao/sharedSessao.dart';
import 'package:agenda_flutter/repositorio/DaoSqLite.dart';
import 'package:agenda_flutter/repositorio/interfaceDao';

import '../entidades/usuario.dart';

class Logincontroller {
  final DaoSqLite _dao = DaoSqLite();

  Future<int> salvar(String nome, String senha) {
    Usuario login = Usuario(nome: nome, senha: senha);
    return _dao.addUser(login);
  }

  Future<bool> login(String nome, String senha) async {
    Future<bool> retorno = _dao.login(nome, senha);
    if (await retorno) {
      SharedSessao.salvarToken(nome);
      return true;
    }
    return false;
  }

  void logout() async {
    SharedSessao.logout();
  }
}