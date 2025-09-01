import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'Frases.db';

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

    await db.execute("INSERT INTO Frases (frases) VALUES ('Acredite em você mesmo e tudo será possível.');");
    await db.execute("INSERT INTO Frases (frases) VALUES ('O sucesso é a soma de pequenos esforços repetidos dia após dia.');");
    await db.execute("INSERT INTO Frases (frases) VALUES ('A persistência realiza o impossível.');");
    await db.execute("INSERT INTO Frases (frases) VALUES ('Não espere por oportunidades, crie-as.');");
    await db.execute("INSERT INTO Frases (frases) VALUES ('O único lugar onde o sucesso vem antes do trabalho é no dicionário.');");
    await db.execute("INSERT INTO Frases (frases) VALUES ('Sua única limitação é você mesmo.');");
    await db.execute("INSERT INTO Frases (frases) VALUES ('Comece onde você está. Use o que você tem. Faça o que você pode.');");
    await db.execute("INSERT INTO Frases (frases) VALUES ('A jornada de mil milhas começa com um único passo.');");
    await db.execute("INSERT INTO Frases (frases) VALUES ('Se você pode sonhar, você pode realizar.');");
    await db.execute("INSERT INTO Frases (frases) VALUES ('A melhor maneira de prever o futuro é criá-lo.');");
  }
}

