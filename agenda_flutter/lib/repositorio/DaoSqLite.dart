import 'package:agenda_flutter/Entidade/contato.dart';
import 'package:agenda_flutter/repositorio/interfaceDao';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DaoSqLite implements InterfaceDao {
  Future<Database> initializeDB() async {
    String path = join(await getDatabasesPath(), 'bd.db');
    return await openDatabase(path, onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE contatos(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email Text, telefone Text)",
      );
    }, version: 1);
  }

  @override
  Future<void> add(Contato contato) async {
    final Database db = await initializeDB();
    await db.insert('contatos', contato.toMap());
    db.close();
  }

  @override
  Future<int> remove(Contato contato) async {
    final Database db = await initializeDB();
    return await db
        .delete("contatos", where: 'id = ?', whereArgs: [contato.id]);
  }

  @override
  Future<List<Contato>> get dados async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('contatos');
    return List.generate(maps.length, (i) {
      return Contato.fromMap(maps[i]);
    });
  }
}
