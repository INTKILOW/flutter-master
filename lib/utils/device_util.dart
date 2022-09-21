import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';

Future<DeviceInfo?> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  bool isPhysicalDevice = false;
  String system = "unknown";
  String name = "unknown";
  String model = "unknown";
  String systemVersion = "unknown";

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    isPhysicalDevice = androidDeviceInfo.isPhysicalDevice ?? false;
    model = androidDeviceInfo.brand ?? "";
    name = androidDeviceInfo.model ?? "";
    systemVersion = androidDeviceInfo.version.release ?? "";
    system = "android";
  } else if (Platform.isIOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;

    isPhysicalDevice = iosDeviceInfo.isPhysicalDevice;
    systemVersion = iosDeviceInfo.systemVersion ?? "unknown";
    model = iosDeviceInfo.model ?? "unknown";
    name = iosDeviceInfo.utsname.machine ?? "unknown";
    debugPrint("${iosDeviceInfo.toMap()}");
    system = "iOS";
  }
  // {name: iPhone 11, model: iPhone, systemName: iOS, utsname: {release: 21.6.0, version: Darwin Kernel Version 21.6.0: Sat Jun 18 17:07:25 PDT 2022; root:xnu-8020.140.41~1/RELEASE_X86_64, machine: x86_64, sysname: Darwin, nodename: zhangkaideMacBook-Pro.local}, systemVersion: 15.5, localizedModel: iPhone, identifierForVendor: 41507E3E-407B-4877-A858-232753D622CF, isPhysicalDevice: false}
  var info = DeviceInfo(isPhysicalDevice, system, name, model, systemVersion);
  return info;
}

class DeviceInfo {
  /// 是不是真机，模拟器
  final bool isPhysicalDevice;

  /// android iOS
  final String system;

  /// iPhone 11
  final String name;

  /// iPhone
  final String model;

  // 15.5
  final String systemVersion;

  DeviceInfo(this.isPhysicalDevice, this.system, this.name, this.model,
      this.systemVersion);

  Map toMap(){
    return {
      "isPhysicalDevice":isPhysicalDevice,
      "system":system,
      "name":name,
      "model":model,
      "systemVersion":systemVersion,

    };
  }
}
