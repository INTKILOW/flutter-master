import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:flutter_master/bean/action_data.dart';

/// 页面跳转
class PageJump {
  static Future<T?>? toModule<T>(ActionData data) {
    dynamic arguments;
    try {
      if (null != data.params) {
        arguments = json.decode(data.params!);
      }
    } catch (e) {
      debugPrint("toModule fail $e");
    }

    return to(
      data.path,
      arguments: arguments,
    );
  }

  static void pushJump(Map<dynamic, dynamic>? message, JPush? jPush) {
    jPush?.setBadge(0);
    try {
      if (message == null) {
        return;
      }

      /// type 0普通用户 1物业人员
      /// action
      var extras = message["extras"];
      // debugPrint("extras $extras");
      if (null != extras) {
        if (Platform.isAndroid) {
          extras = extras["cn.jpush.android.EXTRA"];
          extras = json.decode(extras);
        }
        var type = int.parse(extras["type"].toString());
        var action = extras["action"];
        ActionData actionData = ActionData(action["path"], action["params"]);
        // if (Platform.isAndroid) {
        //   var a = extras["action"];
        //   actionData = ActionData(a["path"], a["params"]);
        // } else {
        //   var a = extras["action"];
        //   actionData = ActionData(a["path"], a["params"]);
        // }
        debugPrint("$type===extras ========== $actionData");
        if (type == 0) {
          /// 0普通用户
          PageJump.toModule(actionData);
        } else {
          PageJump.managerToModulePush(actionData);
        }
      }
    } catch (e) {
      debugPrint("pushJump error $e");
    }
  }

  static Future<T?>? managerToModulePush<T>(ActionData data) {
    dynamic arguments = {};
    try {
      if (null != data.params) {
        arguments = json.decode(data.params!);
      }
    } catch (e) {
      debugPrint("managerToModule error $e");
    }
    return managerToModule(data.path, arguments: arguments);
  }

  static Future<T?>? managerToModule<T>(String path, {dynamic arguments}) {
    arguments ??= {};

    /// 添加通过管理页面跳转
    arguments["managerPage"] = 1;

    debugPrint("页面====$path参数====$arguments===");
    return Get.toNamed(
      path,
      arguments: arguments,
    );
  }

  static int isManagerPage(dynamic arguments) {
    arguments ??= {};

    if (arguments["managerPage"] == 1) {
      return 1;
    }

    return 0;
  }

  static Future<T?>? to<T>(
    String page, {
    dynamic arguments,
  }) {
    return Get.toNamed(page, arguments: arguments, preventDuplicates: false);
  }
}
