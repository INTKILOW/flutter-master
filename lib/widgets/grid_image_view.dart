import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_master/bean/media_data.dart';
import 'package:flutter_master/pages/photo_preview.dart';
import 'package:flutter_master/utils/utils.dart';

import 'empty_network_image.dart';

class GridImageView extends StatelessWidget {
  final double width;
  final List<MediaData>? data;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const GridImageView({Key? key, required this.width, this.data, this.margin, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Container(
        width: width,
        margin: margin,
        padding: padding,
        // color: Colors.blue,
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data?.length ?? 0,
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 5.w,
                mainAxisSpacing: 5.w),
            itemBuilder: (ctx, index) {
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                child: GestureDetector(
                  child: EmptyNetworkImage(
                    imageUrl: data?[index].url,
                    fit: BoxFit.cover,
                  ),
                  onTap: () => navPhotoPreviewPage(
                    data,
                    index,
                  ),
                ),
              );
            }),
      ),
      visible: !listIsEmpty(data),
    );
  }
}
