import 'package:sqflite/sqflite.dart';
import 'package:projetofelype/Domain/user.dart';
import 'db_helper.dart';

class UserDao {
  Future<bool> login(String username, String password) async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM USER WHERE '
        'username = ? AND '
        'password = ? ';

    var result = await db.rawQuery(sql, [username, password]);
    return result.isNotEmpty;
  }

  Future<void> save(User user) async {
    Database db = await DBHelper().initDB();
    db.insert('USER', user.toJson());
  }
}