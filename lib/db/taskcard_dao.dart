import 'package:projetofelype/Domain/task.dart';
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

      print(json);
      Task task = Task.fromJson(json);
      print(task.titulo);
      listaTasks.add(task);
    }

    print("RESULTADO SQL: $result");
    print("LISTA TASKS LENGTH: ${listaTasks.length}");
    return listaTasks;
  }
}