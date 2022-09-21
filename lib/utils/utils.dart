import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_master/user_controller.dart';
import 'package:flutter_master/utils/aliyun_oss.dart';
import 'package:flutter_master/utils/view_utils.dart';
import 'package:flutter_master/widgets/change_default_house.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

bool isZero(String? amount) {
  if (amount == null) {
    return true;
  }

  if (amount.isEmpty || amount == "0" || amount == "0.0" || amount == "0.00") {
    return true;
  }

  return false;
}

bool numberIsNullOrZero(int? num) {
  if (num == null) {
    return true;
  }

  return num == 0;
}

bool boolIsTrue(bool? res) {
  if (res == null) {
    return false;
  }

  return res;
}

bool stringIsNull(String? string) {
  if (string == null || string.isEmpty) {
    return true;
  }
  return false;
}

int getNumber(int? num) {
  if (num != null) {
    return num;
  }

  return 0;
}

bool listIsEmpty(dynamic data) {
  if (data is List) {
    return !data.isNotEmpty;
  }
  return data == null;
}

DateTime getFormatDate(String date) {
  return DateTime.parse(date);
}

List<int> getAction(String? str) {
  try {
    var res = <int>[];
    str?.split("|").forEach((element) {
      res.add(int.parse(element));
    });
    return res;
  } catch (e) {}
  return [];
}

String getActionName(int action) {
  if (action == 1) {
    return "处理";
  }
  return "完工";
}

String getStatus(int? status) {
  if (status == 1) {
    return "客服待处理";
  }

  if (status == 2) {
    return "已完成";
  }
  return "已转报修";
}

Future<void> openPhone(String phone) async {
  var uri = Uri(scheme: 'tel', path: phone);
  canLaunchUrl(uri).then((bool result) {
    launchUrl(uri);
  });
}

Future<void> openWeb(String url) async {
  try {
    final Uri _url = Uri.parse(url);
    await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    );
  } catch (e) {
    /// debugPrint("$e");
  }
}

Future<String?> getLocalPath() async {
  var dir = Platform.isIOS
      ? await getApplicationDocumentsDirectory()
      : await getExternalStorageDirectory();
  return dir?.path;
}

PickerStyle getPickerStyle() {
  return PickerStyle(
    backgroundColor: Get.theme.cardColor,
    textColor: Get.isDarkMode ? Colors.white : Colors.black,
    headDecoration: BoxDecoration(
      color: Get.isDarkMode ? Get.theme.cardColor : Colors.white,
    ),
  );
}

Future<String?> chooseImage() async {
  final context = Get.context;
  if (null == context) {
    return null;
  }
  var types = ["拍照", "相册"];
  var res = await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (ctx) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 10.h,
                  bottom: 10.h,
                ),
                child: Column(
                  children: List.generate(
                    types.length,
                    (index) => InkResponse(
                      radius: 0,
                      highlightColor: Colors.transparent,
                      child: SizedBox(
                        height: 40.h,
                        child: Center(
                          child: Text(
                            types[index],
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(ctx, types[index]);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );

  // debugPrint("===${res}");
  ImageSource? source;
  if (res == "拍照") {
    source = ImageSource.camera;
  } else if (res == "相册") {
    source = ImageSource.gallery;
  }
  if (null != source) {
    EasyLoading.show(status: "加载中...", maskType: EasyLoadingMaskType.clear);

    final XFile? image = await ImagePicker().pickImage(source: source);

    if (null != image) {
      var imgPath = await getTemporaryDirectory();

      debugPrint("${imgPath.path}/${image.name}");

      var destFile = await FlutterImageCompress.compressAndGetFile(
          image.path, "${imgPath.path}/compressed_${image.name}",
          quality: 75);

      var path = await uploadDefault(destFile?.path ?? image.path);
      if (null != path) {
        return path;
      }
    }
    EasyLoading.dismiss();
  }

  return null;
}

/// 保存图片到相册
Future<bool> saveImageToGallery(String url,
    {bool watermark = false, bool netImage = true}) async {
  try {
    await EasyLoading.showProgress(0.0, status: "保存中");

    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "/${DateTime.now().millisecond}.png";

    if (netImage) {
      await Dio().download(
        url,
        savePath,
        onReceiveProgress: (count, total) async {
          await EasyLoading.showProgress(count / total);
        },
      );
    } else {
      await EasyLoading.showProgress(0.3);
      await File(url).copy(savePath);
    }

    if (watermark) {
      var file = File(savePath);
      await addWatermark(file);
    }
    await ImageGallerySaver.saveFile(savePath);
    EasyLoading.showSuccess("保存成功");
    return true;
  } catch (e) {
    debugPrint("$e");
  }

  return false;
}

Future<File> addWatermark(File source, {bool phone = false}) async {
  // ui.Image? originalImage = ui.decodeImage(source.readAsBytesSync());
  // if (null != originalImage) {
  //   final UserController _userController = Get.find();
  //   var userName = _userController.getCurrentUser().value?.name ?? "";
  //   ui.drawString(originalImage, ui.arial_48, 0, 20, '@$userName');
  //   var date = getFormatNowDate();
  //   ui.drawString(originalImage, ui.arial_48, 0, 80, date);
  //   if (phone) {
  //     var _prefs = await SharedPreferences.getInstance();
  //     var phone = _prefs.getString(phoneKey);
  //     ui.drawString(originalImage, ui.arial_48, 0, 140, phone ?? "no phone");
  //   }
  //
  //   List<int> wmImage = ui.encodePng(originalImage);
  //   await source.writeAsBytes(wmImage);
  // }

  return source;
}

String getFormatNowDate() {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
  final String formatted = formatter.format(now);
  // debugPrint(formatted);
  return formatted;
}
