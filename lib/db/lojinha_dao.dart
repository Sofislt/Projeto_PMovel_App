import 'package:sqflite/sqflite.dart';
import 'package:projetofelype/Widgets/ItemCard.dart';
import 'db_helper.dart';

class CardLojaDao {
  Future<List<CardLoja>> listarProdutos() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM produto;';
    var result = await db.rawQuery(sql);

    List<CardLoja> listaProdutos = [];

    await Future.delayed(const Duration(seconds: 2));

    for (var json in result) {
      CardLoja produto = CardLoja.fromJson(json);
      listaProdutos.add(produto);
    }

    return listaProdutos;
  }
}

class DesejoDAO {
  late int produtoId;
  DesejoDAO({required this.produtoId});
  Map<String, dynamic> toJson() {
    return {
      'produtoId': produtoId,
    };
  }
}

class DesejoDao {
  Future<void> adicionar(DesejoDAO d) async {
    final db = await DBHelper().initDB();
    await db.insert('desejo', d.toJson());
  }

  Future<void> remover(int produtoId) async {
    final db = await DBHelper().initDB();
    await db.delete('desejo', where: 'produtoId = ?', whereArgs: [produtoId]);
  }

  Future<List<int>> listarTodos() async {
    final db = await DBHelper().initDB();
    final result = await db.rawQuery('SELECT produtoId FROM desejo');
    return result.map((e) => e['produtoId'] as int).toList();
  }
}