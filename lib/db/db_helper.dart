import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'mare.db';
    String dbPath = join(path, dbName);

    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    print("Banco de dados criado em: $dbPath");
    return database;
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Produto (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        descricao TEXT,
        preco REAL NOT NULL,
        imagem TEXT
      );
    ''');

    await db.insert('Produto', {
      'nome': 'Vestido Encantado',
      'descricao': 'Um vestido mágico com brilho especial.',
      'preco': 120.0,
      'imagem': 'assets/Vestido.jpg'
    });
    await db.insert('Produto', {
      'nome': 'Blusa Fashion',
      'descricao': 'Sempre estiloso.',
      'preco': 250.0,
      'imagem': 'assets/camisa.jpg'
    });
    await db.insert('Produto', {
      'nome': 'Jaqueta Jeans',
      'descricao': 'Clássica e estilosa para qualquer ocasião.',
      'preco': 180.0,
      'imagem': 'assets/jaqueta.jpg'
    });
    await db.insert('Produto', {
      'nome': 'Tênis Esportivo',
      'descricao': 'Confortável para corridas e caminhadas.',
      'preco': 300.0,
      'imagem': 'assets/tenis.jpg'
    });
  }

  // --- Métodos CRUD para produtos ---
  Future<void> inserirProduto(Map<String, dynamic> produto) async {
    final db = await initDB();
    await db.insert('Produto', produto);
  }

  Future<void> limparProdutos() async {
    final db = await initDB();
    await db.delete('Produto');
  }

  Future<List<Map<String, dynamic>>> getProdutos() async {
    final db = await initDB();
    return await db.query('Produto');
  }
}
