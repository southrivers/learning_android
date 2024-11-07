// package开头的是三方包
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_android/repository/datas/home_list_data.dart';
import 'package:learning_android/http/dio_instance.dart';
import 'package:learning_android/repository/api.dart';

import '../../repository/datas/home_banner_data.dart';

/**
 * 这里可以认为是service层，用于获取后台数据并渲染
 */
class HomeViewModel with ChangeNotifier {
  List<BannerItemData>? banners;
  List<Datas>? listview = [];
  List<Datas>? topListview = [];
  int pageNum = 0;

  /**
   * 将静态的方法改成非静态的就需要实例化这个类才可以使用
   */
  // async是必须的，用于标注是异步的
  Future getBanner() async {
    banners = await Api.instance.getBanner();
    // await是异步中的同步操作
    // Response? res = await DioInstance.instance()?.get(url: "banner/json");
    // if (null == res?.data) {
    //   banners = [];
    // } else {
    //   banners = HomeBannerData.fromJson(res?.data).data;
    // }
    // 通知监听组件更新页面
    notifyListeners();
  }

  void initData() async {
    pageNum = 0;
    var ld0 = await getTopItemList();
    var ld1 = await getListData();
    listview
      ?..addAll(ld0 ?? [])
      ..addAll(ld1 ?? []);
    notifyListeners();
  }

  Future getListData() async {
    listview = await Api.instance.getListData(pageNum: pageNum);
    // var response =
    //     await DioInstance.instance()?.get(url: "article/list/1/json");
    // // print(response);
    // if (null != response?.data) {
    //   listview = HomeListData.fromJson(response?.data).data?.datas;
    // } else {
    //   listview = [];
    // }
    // notifyListeners();
  }

  Future getTopItemList() async {
    topListview = await Api.instance.getListData();
  }

  Future loadMore() async {
    pageNum++;
    var res = await Api.instance.getListData(pageNum: pageNum);
    if (res?.isEmpty ?? false) {
      pageNum --;
    }
    listview?.addAll(res??[]);
    notifyListeners();
  }
}
