import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5.h,
      color: Get.theme.dividerColor,
    );
  }
}

Widget buildTopCustomDivider(double height) {
  return Container(
    margin: EdgeInsets.only(top: height),
    child: const CustomDivider(),
  );
}
