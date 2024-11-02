import 'package:agenda_flutter/listagem.dart';
import 'package:agenda_flutter/repositorio/DaoSqLite.dart';
import 'package:agenda_flutter/repositorio/interfaceDao.dart';

class PessoaController {
  final InterfaceDao _dao = DaoSqLite() as InterfaceDao;
  List lista = [];
  salvar(Contato c) {
    _dao.add(c);
  }

  remover(Contato c) {
    _dao.remove(c);
  }

  Future<List<Contato>> listar() {
    return _dao.dados;
  }

  Future<int> size() async {
    lista = await _dao.dados;
    return lista.length;
  }

  info(int indice) async {
    lista = await _dao.dados;
    return _dao.dados;
  }

  Future<Contato> get(int indice) async {
    lista = await _dao.dados;
    return lista[indice];
  }
}