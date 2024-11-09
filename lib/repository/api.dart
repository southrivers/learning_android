import 'package:dio/dio.dart';
import 'package:learning_android/repository/datas/auth_login_response_data.dart';
import 'package:learning_android/repository/datas/auth_response.dart';
import 'package:learning_android/repository/datas/home_banner_data.dart';
import 'package:learning_android/repository/datas/home_list_data.dart';
import 'package:learning_android/repository/datas/hot_key_data.dart';
import 'package:learning_android/repository/datas/hot_webset_data.dart';

import '../http/dio_instance.dart';

/**
 * 说明：这里的api更多的是可以理解为dao层，页面对应的vm层则更多的是service层
 */
class Api {
  // 声明私有构造函数
  Api._();

  // TODO 这里定义单例是这样子直接定义么？是的，这里是使用私有构造函数
  static Api instance = Api._();

  // 实现一个个的方法的调用，在vm里面进行组合
  Future<List<BannerItemData>?> getBanner() async {
    // await是异步中的同步操作
    Response? res = await DioInstance.instance()?.get(url: "banner/json");
    return HomeBannerData.fromJson(res?.data).data;
  }

  Future<List<Datas>?> getListData({int? pageNum = 0}) async {
    var response =
        await DioInstance.instance()?.get(url: "article/list/${pageNum}/json");
    // print(response);
    return HomeListData.fromJson(response?.data).data?.datas;
  }

  // 返回top数据
  Future<List<Datas>?> getTopListData() async {
    var response = await DioInstance.instance()?.get(url: "article/top/json");
    // print(response);
    return TopListData.fromJson(response?.data).datas;
  }

  /**
   * 获取搜索热词
   */
  Future<List<KeyData>?> gethotKey() async {
    var response = await DioInstance.instance()?.get(url: "hotkey/json");
    return HotKeyData.fromJson(response?.data).data;
  }

  /**
   * 获取热点网站
   */
  Future<List<WebData>?> getwebset() async {
    var response = await DioInstance.instance()?.get(url: "friend/json");
    return HotWebsetData.fromJson(response?.data).data;
  }

  // 注册用户信息
  Future<AuthResponse> register(
      {String? username, String? password, String? repassword}) async {
    var response = await DioInstance.instance()
        ?.post(url: "user/register", queryParameters: {
      "username": username,
      "password": password,
      "repassword": repassword,
    });
    return AuthResponse.fromJson(response?.data);
  }

  Future<AuthLoginResponseData> login({
    String? username,
    String? password,
  }) async {
    // 这里是提交表单数据
    var response =
        await DioInstance.instance()?.post(url: "user/login", queryParameters: {
      "username": username,
      "password": password,
    });
    print(response?.data);
    return AuthLoginResponseData.fromJson(response?.data);
  }
}
