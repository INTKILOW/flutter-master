import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Content extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  Content({Key? key, required this.child, this.color, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      padding: padding,
      child: child,
    );
  }
}
