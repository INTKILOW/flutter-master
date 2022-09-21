import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

/// @desc  自定义日志拦截器
class LogsInterceptor extends Interceptor {
  LogsInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = true,
    this.responseBody = true,
    this.error = true,
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    /// debugPrint('=============== Request ===============');
    printKV('uri', options.uri);

    if (request) {
      printKV('method', options.method);
      printKV('responseType', options.responseType);
    }
    if (requestHeader) {
      /// debugPrint('headers:');
      options.headers.forEach((key, v) => printKV(" $key", v));
    }
    if (requestBody) {
      /// debugPrint("data:${options.data.toString()}");
    }
    super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (error) {
      /// debugPrint('========= DioError ===========');
      /// debugPrint("uri: ${err.requestOptions.uri}");
      /// debugPrint("$err");
      if (err.response != null) {
        _printResponse(err.response!);
      }
    }
    super.onError(err, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    /// debugPrint("================ Response ================");
    //_printResponse(response);
    super.onResponse(response, handler);
  }

  void _printResponse(Response response) {
    printKV('uri', response.requestOptions.uri);
    if (responseHeader) {
      printKV('statusCode', response.statusCode.toString());
      /// debugPrint("headers:");
      response.headers.forEach((key, v) => printKV(" $key", v.join(",")));
    }
    if (responseBody) {
      /// debugPrint(response.toString());
    }
  }

  printKV(String key, Object v) {
    /// debugPrint('$key: $v');
  }
}
