# flutter master
````
A new flutter master.
````
````
查看apk keystore  sh1
keytool -list -v -keystore app/
````
# 项目运行
````
flutter pub get
flutter packages pub run build_runner build (生成实体类) // flutter packages pub run build_runner build --delete-conflicting-outputs
flutter run --no-sound-null-safety --dart-define=API_ENV=debug
````

# 安卓最终打包
````
flutter build apk --flavor app --target-platform android-arm64 --no-sound-null-safety --split-per-abi --obfuscate --split-debug-info=splitMap --dart-define=API_ENV=release
--flavor app 多风味 主要用于平台分发huawei xiaomi app……推送使用 默认app
--target-platform 打包平台 android-arm64, android-arm,android-arm64,android-x64
--no-sound-null-safety 去除空警告
--split-per-abi 来分开打包编译不同的ABI版本
--obfuscate 混淆
--split-debug-info=splitMap 生成map表（flutter symbolize -i <stack trace file> -d /out/android/app.android-arm64.symbols）
````
# 文件结构 基本页面
````
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class xxxPage extends extends StatelessWidget {
  final _controller = Get.put(xxxPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting"),
      ),
    );
  }
}
class xxxPageController extends GetxController  {
  var a = 1.obs;
  @override
  void onInit() {
    super.onInit();

  }
}
````

# 实体类新建
### 第一步：固定格式
````
import 'package:json_annotation/json_annotation.dart';
part 'xxx.g.dart';
@JsonSerializable()
class xxx {
  final String a;
  xxx({required this.a});
  factory xxx.fromJson(Map<String, dynamic> json) => _$xxxFromJson(json);
  Map<String, dynamic> toJson() => _$xxxToJson(this);
}
````
### 第二步：执行
````
（mac 可能先执行 source ~/.bash_profile ）
flutter packages pub run build_runner build
````

# 第三方库
### JPush Flutter Plugin 极光推送文档

https://github.com/jpush/jpush-flutter-plugin
### 生成二维码
https://pub.dev/packages/qr_flutter
### 时间选择器
https://pub.dev/packages/flutter_datetime_picker/install
### 微信、支付宝支付
https://github.com/OpenFlutter
### 日期选择
https://github.com/longer96/flutter_pickers
### 打电话发短信 开网页
https://pub.dev/packages/url_launcher
### 图片压缩
https://pub.dev/packages/flutter_image_compress
### 文件存储
https://pub.dev/packages/path_provider
### 权限申请
https://pub.dev/packages/permission_handler/install
### 百度地图
https://lbsyun.baidu.com/index.php?title=flutter/loc/guide/create
### sqflite 数据库
https://pub.dev/packages/sqflite
### qr_code_scanner 二维码扫描
https://github.com/juliuscanute/qr_code_scanner
### 保存图片到相册
https://pub.dev/packages/image_gallery_saver


# 其他
````
一、我们如何收集和使用您的个人信息
二、我们如何使用 Cookie 和同类技术
三、我们如何共享、转让、公开披露用户的个人信息
四、我们如何存储收集的用户信息
五、我们如何使用信息
六、我们如何保证收集的用户信息安全
七、您如何管理个人信息（即，用户主体权利（管理、修改和删除等））
八、未成年人保护
九、如何联系我们
十、隐私政策变更
````
