import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluwx/fluwx.dart';
import 'package:get/get.dart';

class WxMiniPage extends StatelessWidget {
  final _controller = Get.put(WxMiniController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "正在跳转小程序……",
          style: TextStyle(fontSize: 12.sp),
        ),
      ),
    );
  }
}

class WxMiniController extends GetxController {
  @override
  void onReady() {
    if (null != Get.arguments) {
      var type = WXMiniProgramType.RELEASE;

      if (Get.arguments["type"] == "preview") {
        type = WXMiniProgramType.PREVIEW;
      }

      if (Get.arguments["type"] == "test") {
        type = WXMiniProgramType.TEST;
      }
      launchWeChatMiniProgram(
          username: Get.arguments["originId"] ?? "",
          path: Get.arguments["path"],
          miniProgramType: type);
    }
  }
}
