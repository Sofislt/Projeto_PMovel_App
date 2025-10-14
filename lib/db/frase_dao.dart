import 'package:projetofelype/db/db_helper.dart';
import 'package:projetofelype/Domain/frase.dart';
import 'package:sqflite/sqflite.dart';

class FrasesDao {
  Future<List<Frase>> listarFrases() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM Frases;';
    var result = await db.rawQuery(sql);

    List<Frase> listaFrases = [];

    await Future.delayed(Duration(seconds: 3));

    // ForEach
    for (var json in result) {
      Frase frases = Frase.fromJson(json);
      listaFrases.add(frases);
    }

    return listaFrases;
  }
}