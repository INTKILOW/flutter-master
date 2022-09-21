import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_master/main.dart';
import 'package:flutter_master/widgets/app_card.dart';

class CircularProgressWidget extends StatefulWidget {
  _CircularProgressWidget? state;

  @override
  State<StatefulWidget> createState() => _CircularProgressWidget();
}

class _CircularProgressWidget extends State<CircularProgressWidget> {
  var _str = "";
  var _progress = 0.0;

  @override
  void initState() {
    widget.state = this;
  }

  void setData(String str, double progress) {
    setState(() {
      _progress = progress;
      _str = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: SizedBox(
        width: 120.w,
        height: 120.w,
        child: AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: _progress,
                valueColor: AlwaysStoppedAnimation<Color>(
                    MyApp.getSystemInfo().primaryColor),
              ),
              SizedBox(
                height: 8.w,
              ),
              Text(
                _str,
                style: Get.textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
