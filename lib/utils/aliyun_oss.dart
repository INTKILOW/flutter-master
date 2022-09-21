import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_master/core/http/http_manager.dart';

enum OSSType { neighbor, feedback, repair, user }

Future<String?> uploadDefault(String path) async {
  try {
    EasyLoading.show(status: "加载中...", maskType: EasyLoadingMaskType.clear);
    var f = await MultipartFile.fromFile(path);
    FormData formData = FormData();
    formData.files.add(MapEntry("files", f));
    var res =
        await HttpManager().postAsync(url: "v1/upload/file", data: formData);

    if (res["code"] == 200) {
      var pics = res["data"] as List<dynamic>;

      if (pics.isNotEmpty) {
        EasyLoading.showSuccess("上传成功");
        return pics[0];
      } else {
        EasyLoading.showError("上传失败");
      }
    } else {
      EasyLoading.showError(res["message"]);
    }
  } catch (e) {
    debugPrint("${e}");
    EasyLoading.dismiss();
  }

  return null;
}

Future<List<String>> uploadFiles(
  List<String> files, {
  ProgressCallback? onSendProgress,
}) async {
  try {
    FormData formData = FormData();

    for (var element in files) {
      var f = await MultipartFile.fromFile(element);
      formData.files.add(MapEntry("files", f));
    }
    var res = await HttpManager().postAsync(
        url: "v1/upload/file", data: formData, onSendProgress: onSendProgress);

    if (res["code"] == 200) {
      var pics =
          (res["data"] as List<dynamic>).map((e) => e as String).toList();
      if (pics.isNotEmpty) {
        return pics;
      } else {
        return [];
      }
    } else {
      return [];
    }
  } catch (e) {
    EasyLoading.dismiss();
  }

  return [];
}

Future<String?> uploadDefault2(XFile file, OSSType ossType) async {
  try {
    EasyLoading.show(status: "加载中...", maskType: EasyLoadingMaskType.clear);
    String bucket = "";
    String accesskeysecret = "";
    String accessKeyId = "";

    String url = "https://$bucket.oss-cn-beijing.aliyuncs.com";

    /// 验证文本域 这里设置是过期时间         "2025-01-01T12:00:00.000Z
    String policyText =
        '{"expiration": "2099-01-01T12:00:00.000Z","conditions": [{"bucket": "$bucket" },["content-length-range", 0, 1048576000]]}';
    //进行utf8编码
    List<int> policyTextUtf8 = utf8.encode(policyText);

    /// 进行base64编码
    String policyBase64 = base64.encode(policyTextUtf8);

    /// 再次进行utf8编码
    List<int> policy = utf8.encode(policyBase64);

    /// 进行utf8 编码
    List<int> key = utf8.encode(accesskeysecret);

    /// 通过hmac,使用sha1进行加密
    List<int> signaturePre = Hmac(sha1, key).convert(policy).bytes;

    /// 最后一步，将上述所得进行base64 编码
    String signature = base64.encode(signaturePre);

    var f = await MultipartFile.fromFile(file.path);
    var pre = "";
    if (ossType == OSSType.neighbor) {
      pre += "neighbor/";
    } else if (ossType == OSSType.feedback) {
      pre += "feedback/";
    } else if (ossType == OSSType.repair) {
      pre += "feedback/";
    } else if (ossType == OSSType.user) {
      pre += "user/";
    } else {
      pre += "default/";
    }

    DateTime dateTime = DateTime.now();
    pre += "${dateTime.year}/";
    pre += "${dateTime.month}/";
    pre += "${dateTime.day}/";

    final filePath = "$pre${file.name}";

    final fromData = FormData.fromMap({
      /// 文件名
      "FileName": file.name,

      /// 文件夹名称（oss服务中 的文件夹）
      "key": filePath,
      'policy': policyBase64,
      'OSSAccessKeyId': accessKeyId,

      /// 让服务端返回200，不然，默认会返回204
      'success_action_status': '200',
      'signature': signature,
      'file': f
    });
    //dio的请求配置，这一步非常重要！
    BaseOptions options = BaseOptions();
    options.responseType = ResponseType.plain;
    Dio dio = Dio(options);

    await dio.post(url, data: fromData);
    final resUrl = "$url/$filePath";
    EasyLoading.showSuccess("上传成功");
    return resUrl;
  } catch (e) {
    EasyLoading.showSuccess("上传失败");
    return null;
  }
}
