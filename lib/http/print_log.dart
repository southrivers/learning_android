import 'package:dio/dio.dart';

class PrintLog extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("interceptor request request path ${options.uri}");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    // print("interceptor response data: ${response.data}");
    super.onResponse(response, handler);
  }
}
