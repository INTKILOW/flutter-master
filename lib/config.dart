import 'package:flutter_master/bean/system_info.dart';

abstract class Config {
  /// 开发api地址
  String get debugApiUrl;

  /// 正式api地址
  String get releaseApiUrl;

  /// 基础token
  String get baseToken;

  String apiEnv;

  SystemInfo get systemInfo;

  Config({
    this.apiEnv = const String.fromEnvironment(
      'API_ENV',
      defaultValue: "debug",
    ),
  });

  bool isDebug() {
    return apiEnv == 'debug';
  }
}
