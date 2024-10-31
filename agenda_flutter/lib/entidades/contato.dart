class Contato {
  String _nome;
  int? _id;
  String _telefone;
  String _email;
  Contato({id, required nome, required telefone, required email})
      : _email = email,
        _nome = nome,
        _telefone = telefone,
        _id = id;

  String get nome => _nome;
  String get telefone => _telefone;
  String get email => _email;
  int get id => _id ?? 0;

  set id(int id) {
    _id = id;
  }

  set nome(String nome) {
    _nome = nome;
  }

  set email(String email) {
    _email = email;
  }

  set telefone(String telefone) {
    _telefone = telefone;
  }

  factory Contato.fromMap(Map<String, dynamic> map) {
    return Contato(
      id: map['id'],
      nome: map['nome'],
      telefone: map['telefone'],
      email: map['email'],
    );
  }
  Map<String, dynamic> toMap() {
    var map = {
      'nome': _nome,
      'telefone': _telefone,
      'email': _email,
    

    if (_id != null && _id! > 0) {
      map['id'] = _id as String;
    }

    return map;
  }
}
