library http_dio;

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'http_error.dart';

///http请求成功回调
typedef HttpSuccessCallback<T> = void Function(T data);

///失败回调
typedef HttpFailureCallback = void Function(HttpError data);
typedef TokenError = void Function(String message);

///实体转换器
typedef JsonParse<T> = T Function(dynamic data);

/// @desc  封装 http 请求

class HttpManager {
  ///同一个CancelToken可以用于多个请求。
  final Map<String, CancelToken> _cancelTokens = <String, CancelToken>{};

  ///超时时间
  static const int _CONNECT_TIMEOUT = 5000;
  static const int _RECEIVE_TIMEOUT = 5000;

  /// http request methods
  static const String _GET = 'get';
  static const String _POST = 'post';
  static const String _PUT = 'put';
  static const String _DELETE = 'delete';

  Dio? _client;

  static final HttpManager _instance = HttpManager._internal();

  factory HttpManager() => _instance;

  Dio? get client => _client;

  String? _baseToken;
  String? _token;

  TokenError? tokenError;

  /// 创建 dio 实例对象
  HttpManager._internal() {
    if (_client == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions options = BaseOptions(
          connectTimeout: _CONNECT_TIMEOUT,
          receiveTimeout: _RECEIVE_TIMEOUT,
          headers: {
            'Accept': 'application/json,*/*',
            'Content-Type': 'application/json',
          });
      _client = Dio(options);

      /// _client!.interceptors.add(LogsInterceptor());
    }
  }

  /// 更新token
  void setupToken(String token) {
    _token = token;
    if (token.isNotEmpty) {
      _client!.options.headers.addAll({"Authorization": token});
    } else {
      _client!.options.headers.addAll({"Authorization": '$_baseToken'});
    }
  }

  void addHeader(Map<String, dynamic> other) {
    _client?.options.headers.addAll(other);
  }

  String? getToken() {
    return _token;
  }

  void changeBaseURL(String baseUrl) {
    _client!.options.baseUrl = baseUrl;
  }

  ///初始化公共属性
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  void init(
      {required String baseUrl,
      String? token,
      Map<String, String>? header,
      int? connectTimeout,
      int? receiveTimeout,
      List<Interceptor>? interceptors}) {
    if (connectTimeout != null) {
      _client!.options.connectTimeout = connectTimeout;
    }
    if (receiveTimeout != null) {
      _client!.options.receiveTimeout = receiveTimeout;
    }
    _client!.options.baseUrl = baseUrl;

    if (token != null) {
      _baseToken = token;
    }

    if (header != null) {
      _client!.options.headers.addAll(header);
    }
    _client!.options.headers.addAll({"Authorization": '$token'});
    if (interceptors != null && interceptors.isNotEmpty) {
      _client!.interceptors.addAll(interceptors);
    }
  }

  ///Get网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[params] url请求参数支持restful
  ///[successCallback] 请求成功回调
  ///[errorCallback] 请求失败回调
  ///[tag] 请求统一标识，用于取消网络请求
  void get({
    required String url,
    Map<String, dynamic>? params,
    HttpSuccessCallback? successCallback,
    HttpFailureCallback? errorCallback,
    String? tag,
  }) async {
    _request(
      url: url,
      params: params,
      method: _GET,
      successCallback: successCallback,
      errorCallback: errorCallback,
      tag: tag,
    );
  }

  ///post网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[data] post 请求参数
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[successCallback] 请求成功回调
  ///[errorCallback] 请求失败回调
  ///[tag] 请求统一标识，用于取消网络请求
  void post({
    required String url,
    data,
    Map<String, dynamic>? params,
    HttpSuccessCallback? successCallback,
    HttpFailureCallback? errorCallback,
    String tag = "",
  }) async {
    _request(
      url: url,
      data: data,
      method: _POST,
      params: params,
      successCallback: successCallback,
      errorCallback: errorCallback,
      tag: tag,
    );
  }

  ///put网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[data] post 请求参数
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[successCallback] 请求成功回调
  ///[errorCallback] 请求失败回调
  ///[tag] 请求统一标识，用于取消网络请求
  void put({
    required String url,
    data,
    Map<String, dynamic>? params,
    HttpSuccessCallback? successCallback,
    HttpFailureCallback? errorCallback,
    required String tag,
  }) async {
    _request(
      url: url,
      data: data,
      method: _PUT,
      params: params,
      successCallback: successCallback,
      errorCallback: errorCallback,
      tag: tag,
    );
  }

  ///delete网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[data] post 请求参数
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[successCallback] 请求成功回调
  ///[errorCallback] 请求失败回调
  ///[tag] 请求统一标识，用于取消网络请求
  void delete({
    required String url,
    data,
    Map<String, dynamic>? params,
    HttpSuccessCallback? successCallback,
    HttpFailureCallback? errorCallback,
    required String tag,
  }) async {
    _request(
      url: url,
      data: data,
      method: _DELETE,
      params: params,
      successCallback: successCallback,
      errorCallback: errorCallback,
      tag: tag,
    );
  }

  ///统一网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[data] post 请求参数
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[successCallback] 请求成功回调
  ///[errorCallback] 请求失败回调
  ///[tag] 请求统一标识，用于取消网络请求
  void _request({
    required String url,
    required String method,
    data,
    Map<String, dynamic>? params,
    HttpSuccessCallback? successCallback,
    HttpFailureCallback? errorCallback,
    String? tag,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var res = await requestAsync(
        url: url,
        method: method,
        params: params,
        data: data,
        tag: tag,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (null != successCallback) {
        successCallback(res);
      }
    } catch (e) {
      if (null != errorCallback) {
        errorCallback(HttpError(HttpError.NONETWORK, "$e"));
      }
    }
  }

  ///下载文件
  ///
  ///[url] 下载地址
  ///[savePath]  文件保存路径
  ///[onReceiveProgress]  文件保存路径
  ///[data] post 请求参数
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[successCallback] 请求成功回调
  ///[errorCallback] 请求失败回调
  ///[tag] 请求统一标识，用于取消网络请求
  void download({
    required String url,
    required savePath,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? params,
    data,
    HttpSuccessCallback? successCallback,
    HttpFailureCallback? errorCallback,
    String? tag,
  }) async {
    //检查网络是否连接
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (errorCallback != null) {
        errorCallback(HttpError(HttpError.NONETWORK, "网络异常，请稍后重试！"));
      }
      return;
    }
    ////0代表不设置超时
    int receiveTimeout = 0;
    var options = Options(receiveTimeout: receiveTimeout);

    //设置默认值
    params = params ?? {};

    url = _restfulUrl(url, params);

    try {
      CancelToken? cancelToken;
      if (tag != null) {
        cancelToken = _cancelTokens[tag] ?? CancelToken();
        _cancelTokens[tag] = cancelToken;
      }
      Response response = await _client!.download(url, savePath,
          onReceiveProgress: onReceiveProgress,
          queryParameters: params,
          data: data,
          options: options,
          cancelToken: cancelToken);

      /// debugPrint("${response}");
      //成功
      int? statusCode = response.statusCode;
      if (statusCode == 200 && response.data != null) {
        //成功
        if (null != successCallback) {
          successCallback(response.data);
        }
      } else {
        //失败
        String? message = response.statusMessage;
        if (errorCallback != null) {
          errorCallback(HttpError(statusCode, message));
        }
      }
    } catch (e) {
      if (errorCallback != null) {
        errorCallback(HttpError(HttpError.BAD_GATEWAY, "出错了！"));
      }
    }
  }

  ///GET异步网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[tag] 请求统一标识，用于取消网络请求
  Future<T> getAsync<T>({
    required String url,
    Map<String, dynamic>? params,
    JsonParse? jsonParse,
    String? tag,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return requestAsync(
      url: url,
      method: _GET,
      params: params,
      jsonParse: jsonParse,
      tag: tag,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  ///POST 异步网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[data] post 请求参数
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[tag] 请求统一标识，用于取消网络请求
  Future<T> postAsync<T>({
    required String url,
    data,
    Map<String, dynamic>? params,
    JsonParse? jsonParse,
    String? tag,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return requestAsync(
      url: url,
      method: _POST,
      data: data,
      params: params,
      jsonParse: jsonParse,
      tag: tag,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  ///统一网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[data] post 请求参数
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[tag] 请求统一标识，用于取消网络请求
  Future<T> requestAsync<T>({
    required String url,
    required String method,
    data,
    Map<String, dynamic>? params,
    JsonParse? jsonParse,
    String? tag,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    //检查网络是否连接
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      /// debugPrint("请求网络异常，请稍后重试！");
      throw (HttpError(HttpError.NONETWORK, "网络异常，请稍后重试！"));
    }
    //设置默认值
    params = params ?? {};
    var options = Options(
      method: method,
    );

    url = _restfulUrl(url, params);
    // debugPrint("headers: ${_client?.options.headers}");
    try {
      CancelToken? cancelToken;
      if (tag != null) {
        cancelToken = _cancelTokens[tag] ?? CancelToken();
        _cancelTokens[tag] = cancelToken;
      }

      var _prefs = await SharedPreferences.getInstance();
      _client!.options.headers
          .addAll({"Authorization": _prefs.getString("tokenKey")});
      Response response = await _client!.request(
        url,
        queryParameters: params,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      int? code = response.data["code"];

      // debugPrint("$code");
      if (code == 200) {
        //成功
        if (jsonParse != null) {
          return jsonParse(response.data);
        }
        return response.data;
      } else {
        //失败
        String? message = response.data["message"];
        return Future.error("$message");
      }
    } catch (e) {
      if (e is DioError) {
        try {
          final resp = e.response;

          if (resp?.statusCode == 401) {
            String message = resp?.data?["message"] ?? "登录失效";
            if (null != tokenError) {
              tokenError!(message);
            }
          }
        } catch (e) {}
      }
      debugPrint("出错了 ==== $e");
      return Future.error("出错了！");
    }
  }

  ///取消网络请求
  void cancel(String tag) {
    if (_cancelTokens.containsKey(tag)) {
      _cancelTokens[tag]?.cancel();
      _cancelTokens.remove(tag);
    }
  }

  ///restful处理
  String _restfulUrl(String url, Map<String, dynamic> params) {
    params.forEach((key, value) {
      if (url.contains(key)) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    return url;
  }
}
