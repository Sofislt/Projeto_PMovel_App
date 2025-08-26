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

    await db.insert('produto', {
      'nome': 'Vestido Encantado',
      'descricao': 'Um vestido mágico com brilho especial.',
      'preco': 120.0,
      'imagem': 'assets/Vestido.jpg'
    });


    await db.insert('produto', {
      'nome': 'Blusa Fashion',
      'descricao': 'Sempre estiloso.',
      'preco': 250.0,
      'imagem': 'assets/camisa.jpg'
    });


    await db.insert('produto', {
      'nome': 'Jaqueta Jeans',
      'descricao': 'Clássica e estilosa para qualquer ocasião.',
      'preco': 180.0,
      'imagem': 'assets/jaqueta.jpg'
    });


    await db.insert('produto', {
      'nome': 'Tênis Esportivo',
      'descricao': 'Confortável para corridas e caminhadas.',
      'preco': 300.0,
      'imagem': 'assets/tenis.jpg'
    });

    sql = '''
      CREATE TABLE desejo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        produtoId INTEGER NOT NULL,
        FOREIGN KEY(produtoId) REFERENCES produto(id)
      );
    ''';
    await db.execute(sql);
  }
}
