import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'mare.db';

    // C:/aqrquivos/caminhoDoBanco/mare.db
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
    String sql =
        "CREATE TABLE TaskCard (id INTEGER PRIMARY KEY AUTOINCREMENT,titulo TEXT,descricao TEXT);";
    await db.execute(sql);

    sql =
        "CREATE TABLE Desempenho (id INTEGER PRIMARY KEY AUTOINCREMENT,tarefasAtrasadas REAL,tarefasAdiantadas REAL,tarefasDentroDoPrazo REAL);";
    await db.execute(sql);

    sql =
        "CREATE TABLE Produto (id INTEGER PRIMARY KEY AUTOINCREMENT,nome TEXT NOT NULL,descricao TEXT, preco REAL NOT NULL, imagem TEXT);";
    await db.execute(sql);

    sql =
        "CREATE TABLE Frases (id INTEGER PRIMARY KEY AUTOINCREMENT,frases TEXT);";
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

    await db.execute(
        "INSERT INTO Desempenho (tarefasAtrasadas, tarefasAdiantadas, tarefasDentroDoPrazo) VALUES (20, 14, 66);");

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

    await db.execute(
        "INSERT INTO Frases (frases) VALUES ('Acredite em você mesmo e tudo será possível.');");
    await db.execute(
        "INSERT INTO Frases (frases) VALUES ('O sucesso é a soma de pequenos esforços repetidos dia após dia.');");
    await db.execute(
        "INSERT INTO Frases (frases) VALUES ('A persistência realiza o impossível.');");
    await db.execute(
        "INSERT INTO Frases (frases) VALUES ('Não espere por oportunidades, crie-as.');");
    await db.execute(
        "INSERT INTO Frases (frases) VALUES ('O único lugar onde o sucesso vem antes do trabalho é no dicionário.');");
    await db.execute(
        "INSERT INTO Frases (frases) VALUES ('Sua única limitação é você mesmo.');");
    await db.execute(
        "INSERT INTO Frases (frases) VALUES ('Comece onde você está. Use o que você tem. Faça o que você pode.');");
    await db.execute(
        "INSERT INTO Frases (frases) VALUES ('A jornada de mil milhas começa com um único passo.');");
    await db.execute(
        "INSERT INTO Frases (frases) VALUES ('Se você pode sonhar, você pode realizar.');");
    await db.execute(
        "INSERT INTO Frases (frases) VALUES ('A melhor maneira de prever o futuro é criá-lo.');");
  }
}
