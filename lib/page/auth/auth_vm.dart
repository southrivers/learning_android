import 'package:flutter/cupertino.dart';
import 'package:learning_android/repository/api.dart';
import 'package:learning_android/repository/datas/auth_data.dart';

class AuthViewModel extends ChangeNotifier {
  UserInfo registerUserInfo = UserInfo();
  UserInfo loginUserInfo = UserInfo();

  Future<bool> registerUser(
      {String? username, String? password, String? repassword}) async {
    var res = await Api.instance.register(
        username: username, password: password, repassword: repassword);
    if (res.errorCode == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginUser({
    String? username,
    String? password,
  }) async {
    var res = await Api.instance.login(
      username: username,
      password: password,
    );
    if (res.errorCode == 0) {
      return true;
    } else {
      return false;
    }
  }
}
