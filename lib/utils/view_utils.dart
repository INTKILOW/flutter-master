import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_master/main.dart';

BottomNavigationBarItem bottomNavigationBarItem(
    String activeIcon, String title) {
  return BottomNavigationBarItem(
    label: title,
    icon: Image.asset(
      "${activeIcon}_0.png",
      width: 26.w,
      height: 26.h,
    ), // 图标
    activeIcon: Image.asset(
      "${activeIcon}_1.png",
      width: 26.w,
      height: 26.h,
    ), // 高亮图标
  );
}

Widget buildRoundBg(
    {Widget? child,
    double? radius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? w,
    double? h,
    Color? color,
    AlignmentGeometry? alignment}) {
  return Container(
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: w,
    height: h,
    child: child,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(radius ?? 0)),
  );
}

Future<bool> showMyDialog(BuildContext context,
    {String text = "确认删除?",
    String confirm = "确认",
    String cancel = "取消",
    bool mask = false,
    Widget? content}) async {
  var res = await showDialog(
    context: context,
    builder: (ctx) => WillPopScope(
      child: AlertDialog(
        content: content,
        title: Text(
          text,
          style: TextStyle(
              fontSize: 16.sp,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Visibility(
            child: TextButton(
              child: Text(
                cancel,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(ctx).pop(0);
              },
            ),
            visible: cancel.isNotEmpty,
          ),
          TextButton(
            child: Text(
              confirm,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: MyApp.getSystemInfo().primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(ctx).pop(1);
            },
          ),
        ],
      ),
      onWillPop: () async {
        return Future.value(!mask);
      },
    ),
  );

  return res == 1;
}
