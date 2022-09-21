import 'package:flutter/material.dart';
import 'package:flutter_master/bean/protocol_data.dart';

/// 系统参数
class SystemInfo {
  final Color primaryColor;
  final Color shadowColor;
  final String jpushKey;
  final String iosBaiduMapkey;
  final String wxAppId;
  final String iosWxUniversalLink;
  final String h5BaseUrl;
  final List<ProtocolData> protocolDatas;

  SystemInfo({
    required this.protocolDatas,
    required this.h5BaseUrl,
    required this.wxAppId,
    required this.iosWxUniversalLink,
    required this.shadowColor,
    required this.primaryColor,
    required this.jpushKey,
    required this.iosBaiduMapkey,
  });

  MaterialColor getMaterialColor() {
    Map<int, Color> swatch = <int, Color>{};
    swatch[50] = primaryColor;
    for (var i = 1; i <= 9; i++) {
      swatch[i * 100] = primaryColor;
    }
    return MaterialColor(primaryColor.value, swatch);
  }
}
