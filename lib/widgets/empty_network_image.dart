import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyNetworkImage extends StatelessWidget {
  double? width;
  double? height;
  String? imageUrl;
  String? placeholder;
  BoxFit? fit;

  EmptyNetworkImage(
      {Key? key,
      this.width,
      this.height,
      this.imageUrl,
      this.placeholder,
      this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildImage();
  }

  Widget buildImage() {
    if (imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorWidget: (context, url, error) {
          return buildError();
        },
      );
    } else {
      return buildError();
    }
  }

  Widget buildError() {
    return Container(
      height: height,
      width: width,
      color: const Color(0xFFF1F1F1),
      alignment: Alignment.center,
      child: Text(
        "加载失败",
        style: TextStyle(fontSize: 10.sp),
        textAlign: TextAlign.center,
      ),
    );
  }
}
