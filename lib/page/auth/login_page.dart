import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_android/route/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _inputItem(title: "用户名"),
          SizedBox(
            height: 26,
          ),
          _inputItem(title: "密码", security: true),
          SizedBox(
            height: 26,
          ),
          Container(
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
              "开始登录",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutePath.registerPage);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 32),
              padding: EdgeInsets.all(12),
              child: Text(
                "注册",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 输入用户名、密码
  Widget _inputItem({String? title, bool? security}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
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
