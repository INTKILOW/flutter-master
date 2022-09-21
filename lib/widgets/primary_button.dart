import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_master/main.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;

  final double? width;
  final double? height;
  final double textSize;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPressed;

  final bool enable;

  const PrimaryButton(
      {Key? key,
      this.text,
      this.textSize = 16,
      this.onTap,
      this.onDoubleTap,
      this.onLongPressed,
      this.enable = true,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enable ? onTap : null,
      onDoubleTap: enable ? onDoubleTap : null,
      onLongPress: enable ? onLongPressed : null,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: enable
              ? MyApp.getSystemInfo().primaryColor
              : Get.isDarkMode?const Color(0xFF212121):const Color(0xFFf5f5f5),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        width: width ?? 279.w,
        height: height ?? 34.h,
        child: Text(
          text ?? "",
          style: TextStyle(
              color: enable ? Colors.white : const Color(0xFFd9d9d9),
              fontSize: textSize),
        ),
      ),
    );
  }
}
