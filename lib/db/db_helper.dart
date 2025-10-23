import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'mareo.db';

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
    await db.execute('''
      CREATE TABLE TaskCard (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      titulo TEXT,
      descricao TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE Desempenho (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      tarefasAtrasadas REAL,
      tarefasAdiantadas REAL,
      terefasDentroDoPrazo REAL
      );
    ''');

    await db.execute('''
      CREATE TABLE Produto (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      descricao TEXT,
      preco REAL NOT NULL,
      imagem TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE Desejo (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      ProdutoId INTEGER NOT NULL,
      FOREIGN KEY(produtoId) REFERENCES Produto(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE Frases (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      frases TEXT
      );
    ''');


    await db.insert('TaskCard', {
      'titulo': 'Ler o roteiro da feira literária',
      'descricao': '17 páginas'
    });

    await db.insert('TaskCard', {
      'titulo': 'Costurar saia jeans',
      'descricao': 'Aprender ponto overlock à mão'
    });

    await db.insert('TaskCard', {
      'titulo': 'Limpar o celular',
      'descricao': 'Passar álcool na tela e mover vídeos pro drive'
    });

    await db.insert('TaskCard', {
      'titulo': 'Reutilizar o lixo eletrônico',
      'descricao': 'Transformar fios em pulseiras'
    });

    await db.insert('Desempenho', {
      'tarefasAtrasadas': 20.0,
      'tarefasAdiantadas': 14.0,
      'terefasDentroDoPrazo': 66.0
    });

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

    final frases = [
      'Acredite em você mesmo e tudo será possível.',
      'O sucesso é a soma de pequenos esforços repetidos dia após dia.',
      'A persistência realiza o impossível.',
      'Não espere por oportunidades, crie-as.',
      'O único lugar onde o sucesso vem antes do trabalho é no dicionário.',
      'Sua única limitação é você mesmo.',
      'Comece onde você está. Use o que você tem. Faça o que você pode.',
      'A jornada de mil milhas começa com um único passo.',
      'Se você pode sonhar, você pode realizar.',
      'A melhor maneira de prever o futuro é criá-lo.'
    ];
  }
}