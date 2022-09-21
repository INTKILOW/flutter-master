// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      InnerHomeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'data': instance.data,
    };

InnerHomeData _$InnerHomeDataFromJson(Map<String, dynamic> json) =>
    InnerHomeData(
      (json['activityList'] as List<dynamic>)
          .map((e) => InnerActivityData.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['menus'] as List<dynamic>)
          .map((e) => InnerModuleData.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['momentList'] as List<dynamic>)
          .map((e) => InnerNeighborData.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['noticeList'] as List<dynamic>)
          .map((e) => InnerNoticeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['bannerList'] as List<dynamic>)
          .map((e) => BannerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InnerHomeDataToJson(InnerHomeData instance) =>
    <String, dynamic>{
      'activityList': instance.activityList,
      'menus': instance.menus,
      'momentList': instance.momentList,
      'noticeList': instance.noticeList,
      'bannerList': instance.bannerList,
    };
