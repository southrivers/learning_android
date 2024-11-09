import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_android/page/auth/auth_vm.dart';
import 'package:learning_android/route/routes.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  AuthViewModel authViewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return authViewModel;
      },
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _inputItem(
                title: "用户名",
                onChanged: (value) {
                  authViewModel.registerUserInfo.username = value;
                }),
            SizedBox(
              height: 26,
            ),
            _inputItem(
                title: "密码",
                security: true,
                onChanged: (value) {
                  authViewModel.registerUserInfo.password = value;
                }),
            SizedBox(
              height: 26,
            ),
            _inputItem(
                title: "确认密码",
                security: true,
                onChanged: (value) {
                  authViewModel.registerUserInfo.repassword = value;
                }),
            SizedBox(
              height: 26,
            ),
            GestureDetector(
              onTap: () {
                authViewModel
                    .registerUser(
                  username: authViewModel.registerUserInfo.username,
                  password: authViewModel.registerUserInfo.password,
                  repassword: authViewModel.registerUserInfo.repassword,
                )
                    .then((value) {
                  // 这里在page里面尽量用回调函数，在vm里面尽量用async await
                  if (value == true) {
                    // 这一步会跳转到登录页面
                    Navigator.pop(context);
                    showToast("注册成功");
                  } else {
                    showToast("注册失败");
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 32),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Text(
                  "点我注册",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 输入用户名、密码
  Widget _inputItem(
      {String? title, bool? security, ValueChanged<String>? onChanged}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        onChanged: onChanged,
        obscureText: security ?? false,
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
            labelText: title ?? "请输入",
            labelStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}
