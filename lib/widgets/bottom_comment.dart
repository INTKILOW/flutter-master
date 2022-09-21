import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_master/widgets/primary_button.dart';

typedef OnSend = void Function(String content);

class BottomComment extends StatefulWidget {
  final FocusNode? focusNode;
  final String? hintText;
  final OnSend onSend;

  const BottomComment(
      {Key? key, this.focusNode, this.hintText, required this.onSend})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomComment();
}

class _BottomComment extends State<BottomComment> {
  var textEditingController = TextEditingController();

  var content = "";

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(onTextChange);
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.removeListener(onTextChange);
  }

  void onTextChange() {
    setState(() {
      content = textEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: 30.h, minHeight: 30.h),
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            decoration: BoxDecoration(
                color: Get.isDarkMode ?const Color(0xFF212121):Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(4.r))),
            margin: EdgeInsets.only(right: 10.w),
            height: 30.h,
            width: 280.w,
            child: TextField(
              controller: textEditingController,
              focusNode: widget.focusNode,
              style: Get.textTheme.bodySmall,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 13.sp),
                hintText: (widget.hintText ?? "说点什么吧..."),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          SizedBox(
            child: PrimaryButton(
              width: 160.w,
              height: 10.h,
              onTap: () {
                final str = content;
                textEditingController.clear();
                widget.onSend(str);
              },
              enable: content.isNotEmpty,
              text: "发送",
            ),
            width: 60.w,
            height: 25.h,
          )
        ],
      ),
    );
  }
}
