import 'package:dio/dio.dart';
import 'package:learning_android/http/print_log.dart';

import '../repository/datas/response_model.dart';

class DioInstance {
  // 声明私有构造函数
  DioInstance._();

  // 这是示例话的dioinstance, 这样不被外部直接访问，只有通过instance函数才可以访问
  static DioInstance? _dioInstance;

  // 这里返回实例是用来操纵实例中的变量的
  static DioInstance? instance() {
    _dioInstance ??= DioInstance._();
    return _dioInstance;
  }

  Dio _dio = Dio();
  static const _defaultTimeout = Duration(seconds: 30);

  initDio(
      {required String baseUrl,
      Duration? sendTimeout,
      Duration? connectTimeout}) {
    _dio.options = BaseOptions(
        baseUrl: baseUrl,
        sendTimeout: sendTimeout ?? _defaultTimeout,
        connectTimeout: connectTimeout);
    // 添加拦截器
    _dio.interceptors.add(PrintLog());
  }

  // 封装通用的get请求方法
  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options ??
          Options(
            sendTimeout: Duration(
              seconds: 30,
            ),
          ),
      cancelToken: cancelToken,
    );
    return response;
  }

  // 封装通用的post请求
  Future<Response> post({
    required String url,
    Object? data,
    // 这里的参数并不是路由跳转的时候的参数
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options ??
          Options(
            sendTimeout: Duration(
              seconds: 30,
            ),
          ),
      cancelToken: cancelToken,
    );
    return response;
  }
}
