import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluwx/fluwx.dart';
import 'package:get/get.dart';
import 'package:flutter_master/utils/utils.dart';

void shareLink(String link, BuildContext? context, {String? thumbnail, String? title,
  String? description}) {
  if (null == context) {
    return;
  }
  var shareTypes = ["微信", "朋友圈", "复制链接","浏览器"];
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (ctx) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 10.h,
                  bottom: 10.h,
                ),
                margin: EdgeInsets.only(left: 16.w, right: 16.w,bottom: 10.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5.h,
                      color: Get.theme.dividerColor,
                    ),
                  ),
                ),
                child: Row(
                  children: List.generate(
                    shareTypes.length,
                    (index) => GestureDetector(
                      child: _buildShareItem(shareTypes[index]),
                      onTap: () => _action(
                          shareTypes[index], link, thumbnail, title, description,context),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildShareItem(String name) {
  return Container(
    child: Column(
      children: [
        Image.asset(
          getImageByTypes(name),
          width: 32.w,
          height: 32.w,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          name,
          style: TextStyle(color: const Color(0xFF999999), fontSize: 14.sp),
        )
      ],
    ),
    margin: EdgeInsets.only(right: 20.w),
  );
}

String getImageByTypes(String type) {
  if (type == "微信") {
    return "assets/images/share/wx.png";
  }
  if (type == "浏览器") {
    return "assets/images/share/web.png";
  }

  if (type == "朋友圈") {
    return "assets/images/share/pyq.png";
  }

  return "assets/images/share/copy.png";
}

void _action(String type, String link, String? img, String? title,
    String? description,BuildContext context) async {
  if (type == "复制链接") {
    await Clipboard.setData(ClipboardData(text: link));
    EasyLoading.showSuccess("复制成功");
  } else if (type == "朋友圈" || type == "微信") {
    WeChatImage? weChatImage;
    if (null != img) {
      weChatImage = WeChatImage.network(img);
    }

    shareToWeChat(
      WeChatShareWebPageModel(link,
          scene: WeChatScene.TIMELINE,
          thumbnail: weChatImage,
          title: title ?? "",
          description: description ?? ""),
    );
  }else if(type == "浏览器"){
    openWeb(link);
  }
  Navigator.pop(context);
}
