import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_master/bean/protocol_data.dart';
import 'package:flutter_master/bean/system_info.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_master/config.dart';
import 'package:flutter_master/core/http/http_manager.dart';
import 'package:flutter_master/local_router.dart';
import 'package:flutter_master/user_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'config.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final Config _appConfig = MainAppConfig();

  const MyApp({Key? key}) : super(key: key);

  static SystemInfo getSystemInfo() {
    return _appConfig.systemInfo;
  }

  static Config getConfig() {
    return _appConfig;
  }

  @override
  Widget build(BuildContext context) => buildApp(context);

  /// 构建app
  Widget buildApp(BuildContext context) {
    var baseUrl = _appConfig.isDebug()
        ? _appConfig.debugApiUrl
        : _appConfig.releaseApiUrl;
    // 初始化网络请求库
    HttpManager().init(baseUrl: baseUrl, token: _appConfig.baseToken, header: {
      "Platform": "app",
    });

    return ScreenUtilInit(
        designSize: const Size(375, 667),
        builder: (ctx, child) {
          return GetMaterialApp(
            darkTheme: ThemeData(
              cardColor: const Color(0xFF191919),
              canvasColor: const Color(0xFF111111),
              primaryColor: _appConfig.systemInfo.primaryColor,
              primarySwatch: _appConfig.systemInfo.getMaterialColor(),
              dividerColor: const Color(0xFF1F1F1F),
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                color: Color(0xFF111111),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              textTheme: TextTheme(
                displayMedium: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
                displaySmall: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
                bodySmall: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                ),
                displayLarge: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            theme: ThemeData(
              canvasColor: Colors.white,
              primaryColor: _appConfig.systemInfo.primaryColor,
              primarySwatch: _appConfig.systemInfo.getMaterialColor(),
              dividerColor: const Color(0xFFEAEAEA),
              brightness: Brightness.light,
              textTheme: TextTheme(
                displaySmall: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                ),
                displayMedium: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
                displayLarge: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                bodySmall: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                ),
              ),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Color(0xFF333333),
                ),
                color: Colors.white,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            supportedLocales: const [
              Locale("en", "US"),
              Locale("zh", "CN"),
            ],
            initialRoute: HOME_PAGE,
            locale: Get.deviceLocale,
            fallbackLocale: const Locale("zh", "CN"),
            localizationsDelegates: const [
              RefreshLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            getPages: LocalRouter().getPages(),
            builder: (BuildContext context, Widget? child) {
              /// widgetTree app层级
              ///   MaterialApp
              ///     GetMaterialApp
              ///       EasyLoading
              ///         RefreshConfiguration
              ///           ……

              /// loading 配置
              child = EasyLoading.init()(context, child);
              // 上下拉刷新配置
              child = RefreshConfiguration(
                child: child,
                enableBallisticLoad: false,
                hideFooterWhenNotFull: true,
              );

              /// 设置user controller
              final userController = UserController();
              Get.put(userController);

              // 消除状态栏蒙层
              if (Platform.isAndroid) {
                // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，
                // 是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
                SystemUiOverlayStyle systemUiOverlayStyle =
                    const SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent);
                SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
                WebView.platform = SurfaceAndroidWebView();
              }

              return child;
            },
          );
        });
  }

  static void changeLoadingStyle(bool dark) {
    EasyLoading.instance.displayDuration = const Duration(milliseconds: 1500);
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.indicatorColor =
        dark ? const Color(0xFFFFFFFF) : const Color(0xFF605F5F);
    EasyLoading.instance.textColor =
        dark ? const Color(0xFFFFFFFF) : const Color(0xFF605F5F);
    EasyLoading.instance.backgroundColor =
        dark ? const Color(0xFF212121) : const Color(0xFFE8E7E7);
    EasyLoading.instance.indicatorWidget = const CupertinoActivityIndicator();

    EasyLoading.instance.progressColor = MyApp.getSystemInfo().primaryColor;
  }
}

/// app 修改内容
class MainAppConfig extends Config {
  @override
  String get baseToken => "";

  @override
  String get debugApiUrl => "http://172.16.1.83:8889/api/";

  @override
  String get releaseApiUrl => "https://api.sdgzkj.com/api/";

  @override
  SystemInfo get systemInfo => SystemInfo(
        /// h5 url 积分协议9999
        h5BaseUrl: "https:/h5.sdgzkj.com/",

        /// 协议
        protocolDatas: [
          ProtocolData("https://h5.sdgzkj.com/agreement/用户协议.html", "《用户协议》"),
          ProtocolData("https:/h5.sdgzkj.com/agreement/隐私声明.html", "《隐私声明》"),
        ],

        /// 微信支付、分享appId
        wxAppId: "",

        /// 微信支付、分享iOS链接
        iosWxUniversalLink: "",
        shadowColor: const Color(0x71376EFF),
        primaryColor: const Color(0xFF376EFF),

        /// 这个key Android 需要在build.gradle 中修改
        jpushKey: "862bc4b3c552f9d6e1fddfb3",

        /// 这个key Android 需要在AndroidManifest 中修改
        iosBaiduMapkey: "UHNGoV7df8LKdY1fCSknQDQtVnpxHbpj",
      );
}
