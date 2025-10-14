import 'db_helper.dart';
import 'package:projetofelype/Domain/desempenho.dart';
import 'package:sqflite/sqflite.dart';

class DesempenhosDao {
  Future<List<Desempenho>> listarDesempenhos() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM DESEMPENHO;';
    var result = await db.rawQuery(sql);

    List<Desempenho> listaDesempenhos = [];

    await Future.delayed(Duration(seconds: 3));

    //ForEach
    for (var json in result) {
      Desempenho desempenho = Desempenho.fromJson(json);
      listaDesempenhos.add(desempenho);
    }

    return listaDesempenhos;
  }
}