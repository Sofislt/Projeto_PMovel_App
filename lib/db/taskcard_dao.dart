import 'package:projetofelype/domain/task.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class TaskCardDao {
  Future<List<Task>> listarTaskCards() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM TASKCARD;';
    var result = await db.rawQuery(sql);

    List<Task> listaTasks = [];

    await Future.delayed(Duration(seconds: 3));

    // ForEach
    for (var json in result) {
      Task task = Task.fromJson(json);
      listaTasks.add(task);
    }

    return listaTasks;
  }
}