import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const PROVINCES = [
  '京',
  '沪',
  '津',
  '渝',
  '冀',
  '晋',
  '蒙',
  '辽',
  '吉',
  '黑',
  '苏',
  '浙',
  '皖',
  '闽',
  '赣',
  '鲁',
  '豫',
  '鄂',
  '湘',
  '粤',
  '桂',
  '琼',
  '川',
  '贵',
  '云',
  '藏',
  '陕',
  '甘',
  '青',
  '宁',
  '新'
];
const ALPHABETS = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '学',
  '警',
  '挂',
];

typedef OnValueChange<T> = Function(String value);
typedef OnDelete<T> = Function();

class CarKeyboard extends StatefulWidget {
  final OnValueChange? onValueChange;
  final OnDelete? onDelete;
  final String? initValue;

  const CarKeyboard(
      {Key? key, this.onValueChange, this.onDelete, this.initValue})
      : super(key: key);

  @override
  _CarKeyboardState createState() => _CarKeyboardState();
}

class _CarKeyboardState extends State<CarKeyboard> {
  /// 选择省份0 选择车牌号1
  bool showBool = true;
  var resValue = "";

  @override
  void initState() {
    super.initState();
    resValue = widget.initValue ?? "";
    showBool = resValue.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(192, 198, 199, 0.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 50.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: const Color.fromRGBO(164, 170, 174, 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '取消',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '选择车牌号',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    /// 删除内容

                    if (resValue.isNotEmpty) {
                      setState(
                        () {
                          resValue = resValue.substring(0, resValue.length - 1);
                          showBool = resValue.isEmpty;
                          if (null != widget.onValueChange) {
                            widget.onValueChange!(resValue);
                          }
                          // debugPrint(resValue);
                        },
                      );
                    }

                    if (null != widget.onDelete) {
                      widget.onDelete!();
                    }
                  },
                  child: Container(
                    width: 50.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: const Color.fromRGBO(164, 170, 174, 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'X',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(children: [
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  // physics:  NeverScrollableScrollPhysics(),
                  //禁止滑动
                  itemCount: showBool ? PROVINCES.length : ALPHABETS.length,
                  //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //横轴元素个数
                      crossAxisCount: 7,
                      //纵轴间距
                      mainAxisSpacing: 10.0,
                      //横轴间距
                      crossAxisSpacing: 10.0,
                      //子组件宽高长度比例
                      childAspectRatio: 30 / 30),
                  itemBuilder: (BuildContext context, int item) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          var value = "";
                          if (showBool) {
                            value = PROVINCES[item];
                          } else {
                            value = ALPHABETS[item];
                          }

                          resValue += value;
                          showBool = resValue.isEmpty;
                          if (null != widget.onValueChange) {
                            widget.onValueChange!(resValue);
                          }
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            showBool ? PROVINCES[item] : ALPHABETS[item],
                            style: TextStyle(
                                color: const Color.fromRGBO(8, 8, 8, 1),
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ]),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
