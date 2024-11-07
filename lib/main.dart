import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_android/http/dio_instance.dart';
import 'package:learning_android/page/home/home_page.dart';
import 'package:learning_android/route/routes.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  // 初始化客户端
  DioInstance.instance()?.initDio(baseUrl: "https://www.wanandroid.com/");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        // 为什么这里用builder，不用child
        builder: (context, child) {
          return MaterialApp(
            // 下面使用路由的情况下这里的home就可以不再使用了
            // home: HomePage(),
            onGenerateRoute: Routes.generateRoutes,
            // 这种情况下就不再是进入某个具体的页面了，而是进入有菜单的页面，因为菜单里面是有对应的子页面的
            // initialRoute: RoutePath.home,
            initialRoute: RoutePath.tab,
            navigatorKey: Routes.navigatorKey,
          );
        },
      ),
    );
  }
}
