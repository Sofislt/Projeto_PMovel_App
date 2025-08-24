import 'package:projetofelype/domain/taskcard.dart';
import 'package:projetofelype/pages/menuAvatar.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class TaskCardDao {
  Future<List<TaskCard>> listarTaskCards() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM TASKCARD;';
    var result = await db.rawQuery(sql);

    List<TaskCard> listaPropriedades = [];

    await Future.delayed(Duration(seconds: 3));

    // ForEach
    for (var json in result) {
      TaskCard taskcard = TaskCard.fromJson(json);
      listaPropriedades.add(taskcard);
    }

    return listaPropriedades;
  }
}