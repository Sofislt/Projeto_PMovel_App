import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'loja.db';


    String dbPath = join(path, dbName);
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );


    print("Banco criado em: $dbPath");
    return database;
  }


  Future<void> onCreate(Database db, int version) async {
    String sql = '''
      CREATE TABLE produto (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        descricao TEXT,
        preco REAL NOT NULL,
        imagem TEXT
      );
    ''';
    await db.execute(sql);


    sql = '''
      INSERT INTO produto (nome, descricao, preco, imagem)
      VALUES ('Vestido Encantado', 'Um vestido mágico com brilho especial.', 120.0, 'assets/Vestido.jpg');
    ''';
    await db.execute(sql);


    sql = '''
      INSERT INTO produto (nome, descricao, preco, imagem)
      VALUES ('Blusa Fashion', 'Sempre estiloso.', 250.0, 'assets/camisa.jpg');
    ''';
    await db.execute(sql);


    sql = '''
      INSERT INTO produto (nome, descricao, preco, imagem)
      VALUES ('Jaqueta Jeans', 'Clássica e estilosa para qualquer ocasião.', 180.0, 'assets/jaqueta.jpg');
    ''';
    await db.execute(sql);


    sql = '''
      INSERT INTO produto (nome, descricao, preco, imagem)
      VALUES ('Tênis Esportivo', 'Confortável para corridas e caminhadas.', 300.0, 'assets/tenis.jpg');
    ''';
    await db.execute(sql);
  }
}
