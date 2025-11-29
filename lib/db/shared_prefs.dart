import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<void> setUserId(int userId) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setInt('USER_ID', userId);
  }

  Future<void> setUserStatus(bool status) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setBool('LOGIN', status);
  }

  Future<int> getUserID() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    int? userId = instance.getInt('USER_ID');

    return userId ?? 0;
  }

  Future<bool> getUserStatus() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    bool? status = instance.getBool('LOGIN');
    return status ?? false;
  }
}