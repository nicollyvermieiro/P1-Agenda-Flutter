import 'package:agenda_flutter/listagem.dart';

class ContatosRepository {
  final List<Contato> contatos = [];

  void addContatos(Contato c) {
    contatos.add(c);
  }

  void rmvContatos(Contato c) {
    contatos.remove(c);
  }

  void attcontato(int index, Contato c) {
    contatos[index] = c;
  }
  List<Contato> getContatos() {;
    return contatos;
  }
}
