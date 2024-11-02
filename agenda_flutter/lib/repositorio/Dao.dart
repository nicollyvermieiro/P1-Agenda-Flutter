import 'package:agenda_flutter/listagem.dart';
import 'package:agenda_flutter/repositorio/interfaceDao.dart';

class Dao implements InterfaceDao {
  final List<Contato> _dados = [];
  @override
  Future<void> add(Contato contato) async {
    _dados.add(contato);
  }

  @override
  Future<List<Contato>> get dados async => _dados;

  @override
  Future<int> remove(Contato contato) {
    int index = _dados.indexOf(contato);
    if (index != -1) {
      _dados.removeAt(index);
    }
    return Future.value(index);
  }
}