import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_master/local_router.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter_master/bean/media_data.dart';
import 'package:flutter_master/utils/page_jump.dart';
import 'package:flutter_master/utils/utils.dart';

void navPhotoPreviewPage(List<MediaData>? galleryItems, int? current) {
  PageJump.to(PHOTO_PREVIEW_PAGE,
      arguments: {"list": galleryItems ?? [], "current": current ?? 0});
}

class PhotoPreViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhotoPreViewPage();
}

class _PhotoPreViewPage extends State<PhotoPreViewPage> {
  final List<MediaData> galleryItems = Get.arguments["list"];
  final int current = Get.arguments["current"];

  var temp = Get.arguments["current"] + 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                ImageProvider img;

                if (isNetworkImg(galleryItems[index].url)) {
                  img = NetworkImage(galleryItems[index].url);
                } else {
                  img = FileImage(File(galleryItems[index].url));
                }

                return PhotoViewGalleryPageOptions(
                  onTapUp: (context, details, value) {
                    Get.back();
                  },
                  imageProvider: img,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: galleryItems.length,
              pageController: PageController(initialPage: current),
              onPageChanged: (index) {
                setState(() {
                  temp = index + 1;
                });
              }),
          SafeArea(
            child: SizedBox(
              height: 44.h,
              child: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.transparent,
                actions: [
                  UnconstrainedBox(
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 16.w,
                      ),
                      child: GestureDetector(
                        child: const Icon(
                          Icons.download_rounded,
                          color: Colors.white,
                        ),
                        onTap: () {
                          var url = galleryItems[temp - 1].url;
                          saveImageToGallery(url,netImage: isNetworkImg(url));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            ///布局自己换
            bottom: 30.h,
            right: 30.w,
            child: Text(
              '$temp/${galleryItems.length}',
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  bool isNetworkImg(String url) {
    if (url.startsWith("http")) {
      return true;
    }

    return false;
  }
}
