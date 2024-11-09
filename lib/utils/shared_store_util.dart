import 'package:shared_preferences/shared_preferences.dart';

class SharedStore {

  // 保存用户名到本地
  static void saveString({String? username}) async {
    var sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString("username", username ?? "");
  }

  static Future<String?> getString({String? key}) async {
    var sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getString(key??"");
  }
}
