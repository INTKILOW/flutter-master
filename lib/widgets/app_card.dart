import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_master/main.dart';

class AppCard extends StatelessWidget {
  final Widget? child;

  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;

  const AppCard(
      {Key? key, this.child, this.elevation, this.borderRadius, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      shape: RoundedRectangleBorder(
        //修改圆角
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(5.r)),
      ),
      elevation: elevation ?? 4.r,
      // 阴影高度
      borderOnForeground: true,
      // 是否在 child 前绘制 border，默认为 true
      shadowColor: MyApp.getSystemInfo().shadowColor,
      child: child,
    );
  }
}
