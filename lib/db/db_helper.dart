import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'airbnb.db';

    // C:/aqrquivos/jkdahsdja/airbnb.db
    String dbPath = join(path, dbName);
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    print(dbPath);
    return database;
  }

  Future<void> onCreate(Database db, int version) async {
    String sql = '''CREATE TABLE TaskCard (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    descricao TEXT
    );''';

    await db.execute(sql);

    sql =
    "INSERT INTO TaskCard (titulo, descricao) VALUES ('Ler o roteiro da feira literária', '17 páginas');";
    await db.execute(sql);

    sql =
    "INSERT INTO TaskCard (titulo, descricao) VALUES ('Costurar saia jeans', 'Aprender ponto overlock à mão');";
    await db.execute(sql);

    sql =
    "INSERT INTO TaskCard (titulo, descricao) VALUES ('Limpar o celular', 'Passar álcool na tela e mover os vídeos da galeria pro drive');";
    await db.execute(sql);

    sql =
    "INSERT INTO TaskCard (titulo, descricao) VALUES ('Reutilizar o lixo eletrônico', 'Transformar os fios em pulseiras');";
    await db.execute(sql);
  }
}