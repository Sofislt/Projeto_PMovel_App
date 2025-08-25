import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'Frases.db';

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
    String sql = '''CREATE TABLE Frases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    frases TEXT
    );''';

    await db.execute(sql);

    sql =
    "INSERT INTO Frases (frases) VALUES ('cachorro auauau');";
    await db.execute(sql);

    sql =
    "INSERT INTO Frases (frases) VALUES ('cachorro auauau');";
    await db.execute(sql);

    sql =
    "INSERT INTO Frases (frases) VALUES ('cachorro auauau');";
    await db.execute(sql);

    sql =
    "INSERT INTO Frases (frases) VALUES ('cachorro auauau');";
    await db.execute(sql);
  }
}