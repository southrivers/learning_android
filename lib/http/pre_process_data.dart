import 'package:dio/dio.dart';
import 'package:learning_android/repository/datas/response_model.dart';

/**
 * 说明这里返回的数据都是Response类型的，区别于之前的做法，这里是预先解析出来data字段的数据并预先处理了可能存在的异常情况
 */
class PreProcessData extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {}

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {}

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      print(response.data);
      try {
        var res = ResponseModel.fromJson(response.data);
        if (res.errorCode == 0) {
          handler.next(Response(
              requestOptions: response.requestOptions, data: response.data));
        } else if (res.errorCode == -1001) {
          handler.reject(DioException(
              requestOptions: response.requestOptions, error: "未登录"));
        } else {
          handler.next(
              Response(requestOptions: response.requestOptions, data: true));
        }
      } catch (e) {
        handler.reject(
            DioException(requestOptions: response.requestOptions, error: e));
      }
    } else {
      // 请求时报抛出异常
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
        ),
      );
    }
  }
}
