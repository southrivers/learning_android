import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebviewPage extends StatefulWidget {
  String? title;

  WebviewPage({super.key, this.title});

  @override
  State<StatefulWidget> createState() {
    return _WebviewPageState();
  }
}

class _WebviewPageState extends State<WebviewPage> {
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("webview"),
      ),
      body: SafeArea(
        child: Container(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Text("webview ${name ?? ""}"),
            ),
          ),
        ),
      ),
    );
  }

  // 有传递参数的就是用state类型的组件
  @override
  void initState() {
    super.initState();
    // widgetsbinding是组件，可以在当前组件初始化后调用一次
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      // 接收路由参数的方式
      var args = ModalRoute.of(context)?.settings.arguments;
      print(args);
      if (args is Map) {
        name = args["name"];
      }
      // 需要在这里进行state的刷新，因为callback是一个整体，如果放到外面就会有问题
      setState(() {});
    });

  }
}
