import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'mare.db';
    String dbPath = join(path, dbName);

    return await openDatabase(
      dbPath,
      version: 2,
      onCreate: onCreate,
    );
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Produto (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        descricao TEXT,
        preco REAL NOT NULL,
        categoria TEXT,
        imagem TEXT,
        nota REAL,
        votos INTEGER
      );
    ''');

    await db.execute('''
      CREATE TABLE Desejo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        produtoId INTEGER,
        FOREIGN KEY(produtoId) REFERENCES Produto(id)
      );
    ''');
  }

  // ---------------- PRODUTOS -----------------
  Future<void> limparProdutos() async {
    final db = await initDB();
    await db.delete('Produto');
  }

  Future<void> inserirProduto(Map<String, dynamic> produto) async {
    final db = await initDB();
    await db.insert('Produto', produto,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getProdutos() async {
    final db = await initDB();
    return await db.query('Produto');
  }

  // ---------------- WISHLIST -----------------
  Future<void> adicionarDesejo(int produtoId) async {
    final db = await initDB();
    await db.insert('Desejo', {'produtoId': produtoId});
  }

  Future<void> removerDesejo(int produtoId) async {
    final db = await initDB();
    await db.delete('Desejo', where: 'produtoId = ?', whereArgs: [produtoId]);
  }

  Future<bool> isFavorito(int produtoId) async {
    final db = await initDB();
    final result = await db.query('Desejo',
        where: 'produtoId = ?', whereArgs: [produtoId]);
    return result.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> getDesejos() async {
    final db = await initDB();
    return await db.rawQuery('''
      SELECT Produto.* FROM Produto
      INNER JOIN Desejo ON Produto.id = Desejo.produtoId
    ''');
  }
}
