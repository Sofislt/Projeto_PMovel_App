import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async{
    String path = await getDatabasesPath();
    String dbName = 'estatisticas.db';
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
    String sql = '''CREATE TABLE Desempenho (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tarefasAtrasadas REAL,
    tarefasAdiantadas REAL,
    terefasDentroDoPrazo REAL
    );''';

    await db.execute(sql);

    sql = 'INSERT INTO Desempenho (tarefasAtrasadas, tarefasAdiantadas, terefasDentroDoPrazo) VALUES (20, 14, 66);';
  }
}