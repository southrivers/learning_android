import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_android/page/home/home_page.dart';
import 'package:learning_android/page/hotkey/hot_key_page.dart';
import 'package:learning_android/page/message/message_page.dart';
import 'package:learning_android/page/person/person_page.dart';

class TabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabPageState();
  }
}

class _TabPageState extends State<TabPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          HotKeyPage(),
          MessagePage(),
          PersonPage(),
        ],
      ),
      // 这里使用theme是为了去除点击的波纹效果
      bottomNavigationBar: Theme(
          data: ThemeData(
            // 水波纹效果
            splashColor: Colors.transparent,
            // 高亮效果
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            items: _bottomNavBar(),
            currentIndex: _currentIndex,
            onTap: (index) {
              _currentIndex = index;
              setState(() {});
            },
          )),
    );
  }

  List<BottomNavigationBarItem> _bottomNavBar() {
    List<BottomNavigationBarItem> items = [];
    items.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          color: Colors.grey,
        ),
        activeIcon: Icon(
          Icons.home,
          color: Colors.blue,
        ),
        label: "主页",
      ),
    );
    items.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite_border,
          color: Colors.grey,
        ),
        activeIcon: Icon(
          Icons.favorite,
          color: Colors.blue,
        ),
        label: "热点",
      ),
    );
    items.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.chat_bubble_outline,
          color: Colors.grey,
        ),
        activeIcon: Icon(
          Icons.chat_bubble,
          color: Colors.blue,
        ),
        label: "消息"));
    items.add(BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline,
        color: Colors.grey,
      ),
      activeIcon: Icon(
        Icons.person,
        color: Colors.blue,
      ),
      label: "我的",
    ));
    return items;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("tab page state init");
  }
}
