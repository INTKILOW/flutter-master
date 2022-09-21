import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFMapSDK, BMF_COORD_TYPE;
import 'package:flutter_master/main.dart';
import 'package:flutter_master/utils/view_utils.dart';

typedef BDLocationResultCallback = void Function(
    BaiduLocation result, LocationFlutterPlugin locationFlutterPlugin);

Future<bool> getBdLocation(BDLocationResultCallback bdLocationCallback) async {
  var locationStatus = await Permission.location.request();

  if (locationStatus != PermissionStatus.granted) {
    final context = Get.context;
    if (null != context) {
      var res = await showMyDialog(
        context,
        text: "提示？",
        confirm: "开启",
        content: Text(
          "无法获取定位权限，请手动开启",
          style: TextStyle(fontSize: 12.sp),
        ),
      );
      if (res) {}
    }

    return false;
  }

  LocationFlutterPlugin myLocPlugin = LocationFlutterPlugin();

  // 设置是否隐私政策

  myLocPlugin.setAgreePrivacy(true);
  BMFMapSDK.setAgreePrivacy(true);

  // BMFMapSDK.setAgreePrivacy(true);
  if (Platform.isIOS) {
    myLocPlugin.authAK(MyApp.getSystemInfo().iosBaiduMapkey);
    BMFMapSDK.setApiKeyAndCoordType(
        MyApp.getSystemInfo().iosBaiduMapkey, BMF_COORD_TYPE.BD09LL);
    BaiduLocationIOSOption initIOSOptions() {
      BaiduLocationIOSOption options = BaiduLocationIOSOption(
        // 坐标系
        coordType: BMFLocationCoordType.bd09ll,
        // 位置获取超时时间
        locationTimeout: 10,
        // 获取地址信息超时时间
        reGeocodeTimeout: 10,
        // 应用位置类型 默认为automotiveNavigation
        activityType: BMFActivityType.automotiveNavigation,
        // 设置预期精度参数 默认为best
        desiredAccuracy: BMFDesiredAccuracy.best,
        // 是否需要最新版本rgc数据
        isNeedNewVersionRgc: false,
        // 指定定位是否会被系统自动暂停
        pausesLocationUpdatesAutomatically: false,
        // 指定是否允许后台定位,
        // 允许的话是可以进行后台定位的，但需要项目
        // 配置允许后台定位，否则会报错，具体参考开发文档
        allowsBackgroundLocationUpdates: true,
        // 设定定位的最小更新距离
        distanceFilter: 10,
      );
      return options;
    }

    Map iosMap = initIOSOptions().getMap();
    await myLocPlugin.prepareLoc({}, iosMap);
    //接受定位回调
    myLocPlugin.singleLocationCallback(
      callback: (BaiduLocation result) {
        //result为定位结果
        debugPrint("iOS======${result.city}");

        bdLocationCallback(result, myLocPlugin);
      },
    );
  } else if (Platform.isAndroid) {
    BaiduLocationAndroidOption initAndroidOptions() {
      BaiduLocationAndroidOption options = BaiduLocationAndroidOption(
          // 定位模式，可选的模式有高精度、仅设备、仅网络。默  认为高精度模式
          locationMode: BMFLocationMode.hightAccuracy,
          // 是否需要返回地址信息
          isNeedAddress: true,
          // 是否需要返回海拔高度信息
          isNeedAltitude: false,
          // 是否需要返回周边poi信息
          isNeedLocationPoiList: false,
          // 是否需要返回新版本rgc信息
          isNeedNewVersionRgc: false,
          // 是否需要返回位置描述信息
          isNeedLocationDescribe: true,
          // 是否使用gps
          openGps: true,
          // 可选，设置场景定位参数，包括签到场景、运动场景、出行场景
          locationPurpose: BMFLocationPurpose.signIn,
          // 坐标系
          coordType: BMFLocationCoordType.bd09ll,
          // 设置发起定位请求的间隔，int类型，单位ms
          // 如果设置为0，则代表单次定位，即仅定位一次，默认为0
          scanspan: 0);
      return options;
    }

    Map androidMap = initAndroidOptions().getMap();
    await myLocPlugin.prepareLoc(androidMap, {});

    //接受定位回调
    myLocPlugin.seriesLocationCallback(
      callback: (BaiduLocation result) {
        // result为定位结果
        debugPrint("Android======${result.address}");
        bdLocationCallback(result, myLocPlugin);
      },
    );
  }

  bool _suc = false;

  if (Platform.isIOS) {
    _suc = await myLocPlugin
        .singleLocation({'isReGeocode': true, 'isNetworkState': true});
  } else if (Platform.isAndroid) {
    _suc = await myLocPlugin.startLocation();
  }

  debugPrint("location======$_suc");
  return _suc;
}
