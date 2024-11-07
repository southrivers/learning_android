import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:learning_android/page/home/home_vm.dart';
import 'package:learning_android/route/routes.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../repository/datas/home_list_data.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();
  RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    // changenotifier的child是需要存放对象的地方，create只是返回模型的地方
    return ChangeNotifierProvider(
      create: (context) {
        // 这里的create方法返回对应的model
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
          // 必须要知道子组件的高度，但是内部的listview是
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            // 刷新结束需要用相应的complete方法
            // 下拉刷新
            onRefresh: () {
              print("refresh....");
              viewModel.initData();
              _refreshController.refreshCompleted();
              print("refresh complete....");
            },
            // 上拉加载
            onLoading: () {
              print("loading.....");
              viewModel.loadMore();
              _refreshController.loadComplete();
              print("loading complete.....");
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _banner(),
                  /**
                   * swiper、listview都需要外面包裹一个container、expanded、flexable等具有宽高的
                   * 且在外部有singlechildscrollview的情况下，内部不能有expanded
                   */
                  // Expanded(
                  //   child:
                  Consumer<HomeViewModel>(builder: (context, value, child) {
                    return ListView.builder(
                      // 用于高速listview来计算高度，控制子组件收缩到父组件的高度
                      shrinkWrap: true,
                      // 禁止listview的滑动事件，整体的滑动事件就由singlechildscrollview来接管
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return _itemView(value.listview?[index]);
                      },
                      itemCount: value.listview?.length ?? 0,
                      // ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    // consumer也有一个child，不过这个child没什么用
    return Consumer<HomeViewModel>(builder: (context, value, child) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        height: 160,
        width: double.infinity,
        child: Swiper(
          itemCount: value.banners?.length ?? 0,
          indicatorLayout: PageIndicatorLayout.SCALE,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Image.network(
                value.banners?[index].imagePath ?? "",
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      );
    });
  }

  Widget _itemView(Datas? data) {
    return GestureDetector(
      onTap: () {
        // 这里的路由需要和页面进行绑定操作，navigator则是操作路由，且只有在stateful的组件中才可以获取到context
        // Navigator.push(
        //   context,
        //   // 这个类可以用来接收外面传过来的值
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return WebviewPage(title: "from home",);
        //     },
        //   ),
        // );
        // 使用pushNamed来实现名称路由的跳转，调用需要传参
        Navigator.pushNamed(context, RoutePath.webView,
            arguments: {"name": "wangershuai"});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                // 设置圆角快捷方案，也可以使用container，不过相对来说绕了一点
                ClipRRect(
                  child: Image.network(
                    "https://dummyimage.com/300.png/09f/fff",
                    height: 30,
                    width: 30,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(data?.author ?? ""),
                Expanded(
                  child: SizedBox(),
                ),
                Text(data?.niceDate ?? ""),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "置顶",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              data?.title ?? "",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(data?.superChapterName ?? ""),
                Expanded(child: SizedBox()),
                Image.network(
                  "https://dummyimage.com/300.png/09f/fff",
                  height: 15,
                  width: 15,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // view更多的是controller层，用来获取vm_model中对应的接口数据
  @override
  void initState() {
    super.initState();
    viewModel.getBanner();
    viewModel.initData();
    // print("object");
    // fetchBanner();
  }

// void fetchBanner() async {
//   banners = await HomeViewModel.getBanner();
//   // 这里的方法调用会导致整个页面进行刷新，更好的情况是哪里更新哪里刷新
//   setState(() {});
// }
}
