

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitle extends StatelessWidget{
  final String text;
  const AppTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Text(text,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),);
  }

}