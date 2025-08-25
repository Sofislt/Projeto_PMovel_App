import 'package:sqflite/sqflite.dart';
import 'cardLoja.dart';
import 'dbHelperLoja.dart';

class CardLojaDao {
  Future<List<CardLoja>> listarProdutos() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM produto;';
    var result = await db.rawQuery(sql);


    List<CardLoja> listaProdutos = [];


    // (Opcional: simula carregamento demorado)
    await Future.delayed(Duration(seconds: 2));


    for (var json in result) {
      CardLoja produto = CardLoja.fromJson(json);
      listaProdutos.add(produto);
    }


    return listaProdutos;
  }
}
