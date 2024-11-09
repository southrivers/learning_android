import 'package:flutter/cupertino.dart';
import 'package:learning_android/repository/api.dart';
import 'package:learning_android/repository/datas/auth_data.dart';
import 'package:learning_android/utils/shared_store_util.dart';

// TODO 不同页面之间模型数据的传递会怎么样？？？？因为不同的页面实例化的是不同的model，这样看起来会存在问题

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
      // 登录成功就记录到本地用户名
      SharedStore.saveString(username: res.data?.username);
      return true;
    } else {
      return false;
    }
  }
}
