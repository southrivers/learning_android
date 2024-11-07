
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        children: [
          _inputItem(),
          SizedBox(height: 26,),
          _inputItem()
        ],
      ),
    );
  }
  // 输入用户名、密码
  Widget _inputItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.5,),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1,),
          ),
          labelText: "请输入",
          labelStyle: TextStyle(color: Colors.white)
        ),
      ),
    );
  }
}