import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<void> setUserStatus(bool status) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setBool('LOGIN', status);
  }

  Future<bool> getUserStatus() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    bool? status = instance.getBool('LOGIN');

    return status ?? false;
  }
}