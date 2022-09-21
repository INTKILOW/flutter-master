import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_master/widgets/app_card.dart';
import 'package:flutter_master/widgets/empty_network_image.dart';

class CateItem extends StatelessWidget {
  final String icon;
  final String title;

  const CateItem({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: SizedBox(
        width: 75.w,
        height: 75.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmptyNetworkImage(
              imageUrl: icon,
              width: 40.w,
              height: 40.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
                color: Get.isDarkMode?Colors.white:const Color(0xFF1D336D),
              ),
            )
          ],
        ),
      ),
    );
  }
}
