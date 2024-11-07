import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_android/route/routes.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonState();
}

class _PersonState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(color: Colors.teal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutePath.loginPage);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          30,
                        ),
                      ),
                      child: Image.network(
                        "http://gips3.baidu.com/it/u=3886271102,3123389489&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "未登录",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            _tailItem(title: "我的收藏"),
            _tailItem(title: "检查更新"),
            _tailItem(title: "关于我们"),
          ],
        ),
      ),
    );
  }

  Widget _tailItem({String? title}) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          Text(title ?? ""),
          Expanded(child: SizedBox()),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
