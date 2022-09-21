import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_master/apis.dart';
import 'package:flutter_master/core/http/http_manager.dart';
import 'package:flutter_master/user_controller.dart';
import 'package:flutter_master/utils/baidu_map.dart';
import 'package:flutter_master/utils/page_jump.dart';
import 'package:flutter_master/utils/view_utils.dart';

class HomePage extends StatelessWidget {
  final _controller = Get.put(HomePageController());
  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(()=> PageView(
        controller: _controller._pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _controller.pages.value,
      ),),
      bottomNavigationBar: Obx(()=>Theme(
        data: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor:Get.isDarkMode? Colors.black:Colors.white,
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          unselectedItemColor: Colors.grey,//主要用于设置item及字体颜色
          type: BottomNavigationBarType.fixed,
          currentIndex: _controller.currentIndex.value,
          onTap: (index) {
            _controller.currentIndex.value = index;
            _controller._pageController.jumpToPage(index);
          },
          items: _userController.createPageMenu(),
        ),
      )),
    );
  }
}

class HomePageController extends GetxController {
  var currentIndex = 0.obs;
  UserController userController = Get.find();
  final _pageController = PageController();

  LocationFlutterPlugin? _locationFlutterPlugin;

  var pages = <Widget>[].obs;


  @override
  void onReady()   {
    super.onReady();

    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //       statusBarIconBrightness:
    //       Brightness.light // dark:一般显示黑色   light：一般显示白色
    //   ),
    // );

    pages.value =  userController.createPages();

    userController.registerLogin401();
    _checkLaunchJPushMessage();
    _addJPushNotification();
    _checkNotificationEnable();
  }


  _addJPushNotification(){
    /// 监听推送消息
    userController.getJPush()?.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        debugPrint("flutter onOpenNotification: $message");

        PageJump.pushJump(message, userController.getJPush());
      },

      /// 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
    );
  }
  _checkLaunchJPushMessage() async{
    try {
      if (Platform.isIOS) {
        var message =
        await userController.getJPush()?.getLaunchAppNotification();
        PageJump.pushJump(message, userController.getJPush());
      } else if (Platform.isAndroid) {
        PageJump.pushJump(
            userController.androidLaunchPush, userController.getJPush());
      }
    } catch (e) {}

  }
  _checkNotificationEnable() async{
    /// 推送打开提醒
    final isNotificationEnabled =
        await userController.getJPush()?.isNotificationEnabled() ?? true;
    if (!isNotificationEnabled) {
      final ctx = Get.context;
      if (null == ctx) {
        return;
      }
      var res = await showMyDialog(
        ctx,
        text: "温馨提示",
        content: Text(
          "检测到应用的通知没有打开，可能错过重要消息接收。",
          style: TextStyle(fontSize: 12.sp),
        ),
        confirm: "马上打开",
      );
      if (res) {
        userController.getJPush()?.openSettingsForNotification();
      }
    }
  }

  @override
  void onClose() {
    /// 移除推送
    userController.getJPush()?.addEventHandler();
    _locationFlutterPlugin?.stopLocation();
    userController.unRegisterLogin401();
  }
}
