import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum StateType { noData, none, loading }

class StateLayout extends StatelessWidget {
  final StateType stateType;
  final Widget child;

  final Widget? centerImage;
  final Widget? bottomText;

  const StateLayout(
      {Key? key,
      required this.stateType,
      required this.child,
      this.centerImage,
      this.bottomText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (stateType == StateType.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (stateType == StateType.none) {
      return child;
    }
    return _buildEmptyWidget();
  }

  Widget _buildEmptyWidget() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 72.h),
      child: Column(
        children: [
          centerImage ??
              Image.asset(
                "assets/images/empty/no_data.png",
                width: 110.w,
              ),
          SizedBox(height: 6.h,),
          bottomText ??
              Text(
                "暂无数据",
                style:
                    TextStyle(color: const Color(0xFF999999), fontSize: 14.sp),
              ),
        ],
      ),
    );
  }
}
