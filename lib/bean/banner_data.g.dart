// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerData _$BannerDataFromJson(Map<String, dynamic> json) => BannerData(
      json['url'] as String,
      json['action'] == null
          ? null
          : ActionData.fromJson(json['action'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'url': instance.url,
      'action': instance.action,
    };
