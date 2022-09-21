import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluwx/fluwx.dart';
import 'package:get/get.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:flutter_master/bean/user.dart';
import 'package:flutter_master/core/http/http_manager.dart';
import 'package:flutter_master/main.dart';
import 'package:flutter_master/pages/main/index.dart';
import 'package:flutter_master/pages/main/mine.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/view_utils.dart';

const tokenKey = "tokenKey";

class UserController extends GetxController {
  /*

    user:{
      name:"",
      avatar:"",
      sex:1,
      phone:"",
      isManager:true,
      role:["业主","管理员"],
    }

   */

  final _currentUser = Rx<User?>(null);

  /// 安卓冷启动推送信息
  Map<String, dynamic>? androidLaunchPush;
  JPush? _jpush;

  Rx<User?> getCurrentUser() {
    return _currentUser;
  }


  void unRegisterLogin401() {
    HttpManager().tokenError = null;
  }

  void registerLogin401() {
    HttpManager().tokenError = (String message) {
      final ctx = Get.context;

      if (null != ctx) {
        showDialog(
            context: ctx,
            builder: (ctx) {
              return WillPopScope(
                  child: AlertDialog(
                    content: Text(
                      message,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                    title: Text(
                      "温馨提示",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text(
                          "确定",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: MyApp.getSystemInfo().primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.of(ctx).pop(1);
                          logout();
                        },
                      ),
                    ],
                  ),
                  onWillPop: () async {
                    return Future.value(false);
                  });
            });
      }
    };
  }

  Future<bool> initUser() async {
    var _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString(tokenKey);

    HttpManager().setupToken(token ?? "");
    if (_prefs.containsKey(tokenKey)) {
      try {
        var user = await HttpManager().getAsync(
          url: "init",
          jsonParse: (data) => User.fromJson(data["data"]),
        );
        await updateUser(user);
        return true;
      } catch (e) {
        EasyLoading.showError(
          "登录失效",
          duration: const Duration(milliseconds: 550),
        );
        var _prefs = await SharedPreferences.getInstance();
        _prefs.remove(tokenKey);
      }
    }
    return false;
  }

  JPush? getJPush() {
    return _jpush;
  }

  /// 需要同意用户协议后调用 初始化极光推送
  Future<void> initJPush() async {
    _jpush = JPush();
    if (Platform.isAndroid) {
      _jpush?.addEventHandler(
        onOpenNotification: (Map<String, dynamic> message) async {
          debugPrint("flutter xxxxx onOpenNotification: $message");
          androidLaunchPush = message;
        },
      );
    }

    _jpush?.setup(
      appKey: MyApp.getSystemInfo().jpushKey,
      channel: "developer-default",
      production: true,
      debug: false,
    );

    if (Platform.isIOS) {
      /// 在 xcode8 之后需要点开推送选项： TARGETS -> Capabilities -> Push Notification 设为 on 状态
      /// iOS使用推送功能，需要调用申请通知权限的方法
      /// https://github.com/jpush/jpush-flutter-plugin/blob/dev-2.x/documents/APIs.md#applyPushAuthority
      _jpush?.applyPushAuthority(
        const NotificationSettingsIOS(sound: true, alert: true, badge: true),
      );
    }
  }

  /// 初始化微信sdk
  Future<void> initWxSDK() async {
    var systemInfo = MyApp.getSystemInfo();

    if (systemInfo.wxAppId.isEmpty || systemInfo.iosWxUniversalLink.isEmpty) {
      return;
    }
    var doOnIOS = Platform.isIOS;
    await registerWxApi(
      doOnAndroid: !doOnIOS,
      doOnIOS: doOnIOS,
      appId: systemInfo.wxAppId,
      universalLink: systemInfo.iosWxUniversalLink,
    );
  }

  /// 将user 存入本地
  Future<void> updateUser(User userData) async {
    /// 更新用户
    _currentUser.value = userData;
    // 更新token
    HttpManager().setupToken(userData.token);
    // debugPrint("${userData.token}");

    // 将token写入本地
    var _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(tokenKey, userData.token);



    try {
      await _jpush?.cleanTags();
      if (null != userData.pushTags) {
        await _jpush?.setTags(userData.pushTags!);
      }
    } catch (e) {
      debugPrint("setTags err: $e");
    }

    // debugPrint("userData = ${json.encode(userData)}");
  }

  Future<void> logout() async {
    EasyLoading.show(status: '请稍后...', maskType: EasyLoadingMaskType.clear);
    var _prefs = await SharedPreferences.getInstance();
    await _prefs.remove(tokenKey);
    HttpManager().setupToken("");
    // Get.offAllNamed(LOGIN_PAGE);
    _currentUser.value = null;
    EasyLoading.dismiss();
  }

  List<Widget> createPages() {
    var pages = <Widget>[];
    pages.add(Index());
    pages.add(Mine());
    return pages;
  }

  List<BottomNavigationBarItem> createPageMenu() {
    var pagesMenu = <BottomNavigationBarItem>[];

    pagesMenu.add(
      bottomNavigationBarItem("assets/images/tabbar/home", "首页"),
    );
    pagesMenu.add(
      bottomNavigationBarItem("assets/images/tabbar/mine", "我的"),
    );
    return pagesMenu;
  }
}
