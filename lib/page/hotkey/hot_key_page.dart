import 'package:flutter/material.dart';
import 'package:learning_android/page/hotkey/hot_key_vm.dart';
import 'package:learning_android/repository/datas/hot_webset_data.dart';
import 'package:learning_android/route/routes.dart';
import 'package:provider/provider.dart';

import '../../repository/datas/hot_key_data.dart';

class HotKeyPage extends StatefulWidget {
  const HotKeyPage({Key? key}) : super(key: key);

  @override
  State<HotKeyPage> createState() => _HotKeyState();
}

class _HotKeyState extends State<HotKeyPage> {
  HotKeyViewModel hotKeyViewModel = HotKeyViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) {
            return hotKeyViewModel;
          },
          child: SingleChildScrollView(
            // column没有指定高度，应该要使用expanded撑满
            child: Column(
              children: [
                _title(
                  title: "热词搜索",
                  icon: Icon(Icons.search),
                ),
                // 热词列表
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Consumer<HotKeyViewModel>(
                      builder: (context, value, child) {
                    return _gridView(
                        keyData: hotKeyViewModel.keyData,
                        // 通过传入回调函数来获取子组件的数据
                        itemTap: (value) {
                          print(value);
                        });
                  }),
                ),
                _title(
                  title: "常用网站",
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Consumer<HotKeyViewModel>(
                      builder: (context, value, child) {
                    return _gridView(
                        webData: hotKeyViewModel.webData,
                        // 通过传入回调函数来获取子组件的数据
                        itemTap: (value) {
                          print(value);
                          Navigator.pushNamed(
                            context,
                            RoutePath.webView,
                            arguments: {"name": value},
                          );
                        });
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _gridView(
      {List<KeyData>? keyData,
      List<WebData>? webData,
      ValueChanged<String>? itemTap}) {
    return GridView.builder(
      // 设置网格的参数：包含横向的元素的数量、宽高比
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //SliverGridDelegateWithFixedCrossAxisCount
        crossAxisCount: 4,
        childAspectRatio: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 12,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (null != keyData) {
          return GestureDetector(
            onTap: () {
              // 在固有的回调函数中来获取对应的参数
              itemTap?.call(keyData[index].name ?? "");
            },
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 0.3,
                ),
              ),
              child: Center(
                child: Text(keyData[index].name ?? ""),
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              // 在固有的回调函数中来获取对应的参数
              itemTap?.call(webData?[index].name ?? "");
            },
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 0.3,
                ),
              ),
              child: Center(
                child: Text(webData?[index].name ?? ""),
              ),
            ),
          );
        }
      },
      // gridview的itemcount是很关键的
      itemCount: keyData?.length ?? (webData?.length ?? 0),
    );
  }

  Widget _title({String? title, Widget? icon}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      child: Row(
        children: [
          Text(title ?? ""),
          Expanded(child: SizedBox()),
          icon ?? Text(""),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // TODO 初始化调用，不确定是不是这样调用的
    hotKeyViewModel.initData();
  }
}
