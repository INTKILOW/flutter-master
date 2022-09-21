import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_master/bean/repair_detail_data.dart';
import 'package:flutter_master/main.dart';
import 'package:flutter_master/pages/photo_preview.dart';
import 'package:flutter_master/utils/utils.dart';
import 'package:flutter_master/utils/view_utils.dart';

import 'empty_network_image.dart';
import 'nine_grid_view.dart';

class WorkFlowWidget extends StatelessWidget {
  final List<InnerProcessData>? data;
  final bool worker;

  const WorkFlowWidget({Key? key, this.data, this.worker = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data?.length ?? 0,
        itemBuilder: (ctx, index) {
          return _buildItem(
              (data ?? [])[index], (data ?? []).length - 1 == index, index);
        });
  }

  Widget _buildItem(InnerProcessData data, bool last, int index) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              buildRoundBg(
                w: 20.w,
                h: 20.w,
                alignment: Alignment.center,
                radius: 20.w,
                color: MyApp.getSystemInfo().primaryColor,
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp),
                ),
              ),
              Expanded(
                child: Container(
                  width: 2.w,
                  color: last
                      ? Colors.transparent
                      : MyApp.getSystemInfo().primaryColor,
                  margin: EdgeInsets.only(top: 4.h, bottom: 4.h),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data.userName}：${data.title}",
                  style: TextStyle(
                    color: index == 0
                        ? MyApp.getSystemInfo().primaryColor
                        : const Color(0xFF999999),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  data.createTime,
                  style: TextStyle(
                      color: const Color(0xFF8D8D8D), fontSize: 10.sp),
                ),
                Visibility(
                  child: buildRoundBg(
                    margin: EdgeInsets.only(top: 5.h),
                    radius: 4.r,
                    padding: EdgeInsets.all(4.r),
                    color: Get.isDarkMode?const Color(0xFF212121):const Color(0xFFF0F0F0),
                    child: Text(
                      "内部备注：${data.remark}",
                      style: TextStyle(
                          color:Get.isDarkMode?Colors.white: const Color(0xFF676767),
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp),
                    ),
                  ),
                  visible: !stringIsNull(data.remark) && worker,
                ),
                Visibility(
                  child: Container(
                    child: Text(
                      data.content,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    margin: EdgeInsets.only(top: 5.h),
                  ),
                  visible: data.content.isNotEmpty,
                ),
                Container(
                  child: NineGridView(
                    width: 200.w,
                    itemCount: data.mediaList?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.r),
                        ),
                        child: GestureDetector(
                          child: EmptyNetworkImage(
                            imageUrl: data.mediaList?[index].url,
                          ),
                          onTap: () => navPhotoPreviewPage(
                            data.mediaList,
                            index,
                          ),
                        ),
                      );
                    },
                  ),
                  margin: EdgeInsets.only(top: 5.h),
                ),
                SizedBox(
                  height: 5.h,
                ),
                _getCommitLevel(data.score),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getCommitLevel(int score) {
    if (score == 0) {
      return Container();
    }

    if (score == 1) {
      return Container(
        child: Image.asset(
          "assets/images/repair/bad_1.png",
          width: 24.w,
          height: 24.w,
        ),
        margin: EdgeInsets.only(bottom: 5.h),
      );
    }
    if (score == 3) {
      return Container(
        child: Image.asset(
          "assets/images/repair/normal_1.png",
          width: 24.w,
          height: 24.w,
        ),
        margin: EdgeInsets.only(bottom: 5.h),
      );
    }
    return Container(
      child: Image.asset(
        "assets/images/repair/good_1.png",
        width: 24.w,
        height: 24.w,
      ),
      margin: EdgeInsets.only(bottom: 5.h),
    );
  }
}
