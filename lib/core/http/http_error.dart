import 'package:dio/dio.dart';

/// @desc  网络请求错误
class HttpError {
  ///HTTP 状态码
  static const int UNAUTHORIZED = 401;

  static const int FORBIDDEN = 403;

  static const int NOT_FOUND = 404;

  static const int REQUEST_TIMEOUT = 408;

  static const int INTERNAL_SERVER_ERROR = 500;

  static const int BAD_GATEWAY = 502;

  static const int SERVICE_UNAVAILABLE = 503;

  static const int GATEWAY_TIMEOUT = 504;

  static const int NONETWORK = -1;


  int? code;

  String? message;

  HttpError(this.code, this.message);

  HttpError.dioError(DioError error) {
    message = error.message;
    code = error.response?.statusCode;
    switch (error.type) {
      case DioErrorType.connectTimeout:
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.receiveTimeout:
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.sendTimeout:
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.response:
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.cancel:
        message = "请求已被取消，请重新请求";
        break;
      case DioErrorType.other:
        message = "网络异常，请稍后重试！";
        break;
    }
  }

  @override
  String toString() {
    return 'HttpError{code: $code, message: $message}';
  }
}