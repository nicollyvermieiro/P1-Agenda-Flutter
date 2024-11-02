import 'package:agenda_flutter/entidades/contato.dart';

abstract class InterfaceDao {

  Future<void> add(Contato contato);
  Future<int> remove(Contato contato);
  Future<List<Contato>> get dados;
}