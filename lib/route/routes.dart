// 注册路由地址
import 'package:flutter/material.dart';
import 'package:learning_android/page/auth/login_page.dart';
import 'package:learning_android/page/home/home_page.dart';
import 'package:learning_android/page/tab_page.dart';
import 'package:learning_android/page/webview_page.dart';

import '../page/auth/register_page.dart';

class Routes {
  Routes._();

  // TODO 这里的navigatorKey用来做什么的？ 好像是在一些类中间拿不到上下文，就可以通过这里的变量拿到上下文
  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static NavigatorState get navigator => navigatorKey.currentState!;

  // 静态方法，实现路由的全局注册，settings对象是方便传递参数
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    // 这里是需要知道跳转到哪个页面
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(HomePage());
      case RoutePath.webView:
        // 路由需要传参
        return pageRoute(WebviewPage(), settings: settings);
      case RoutePath.tab:
        // TODO 需要判断不传settings的情况下，子页面能不能获取到路由传值
        return pageRoute(TabPage());
      case RoutePath.loginPage:
        return pageRoute(LoginPage(), settings: settings);
      case RoutePath.registerPage:
        return pageRoute(RegisterPage(), settings: settings);
    }
    // 未定义页面判断
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: SafeArea(child: Text("unkonwn page")),
        );
      },
    );
  }

  static MaterialPageRoute<dynamic> pageRoute(
    Widget target, {
    /**
     * this.name,this.arguments，这里包含路由的名称和传过来的参数，是很重要的
     */
    RouteSettings? settings,
    bool? fullscreenDialog,
  }) {
    return MaterialPageRoute(
        builder: (context) {
          return target;
        },
        settings: settings,
        // ？定义的时候表示可空，使用变量的时候用来询问是否为空，为空返回null，!用来要求不为空
        fullscreenDialog: fullscreenDialog ?? false);
  }
}

// 定义路由地址
class RoutePath {
  // 提前定义好的带路径的路由都是静态路由，
  static const String home = "/";
  static const String tab = "/tab";
  static const String webView = "/web_view_page";

  static const String loginPage = "/login";
  static const String registerPage = "/register";
// 在跳转的时候才传入的widget才是动态路由
}
