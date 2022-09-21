// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseDetailData _$HouseDetailDataFromJson(Map<String, dynamic> json) =>
    HouseDetailData(
      json['id'] as int,
      json['communityName'] as String,
      json['fullName'] as String,
      json['houseType'] as String,
      json['propertyRight'] as String,
      json['buildArea'] as String,
      (json['list'] as List<dynamic>)
          .map((e) => InnerHouseDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isHost'] as bool,
    );

Map<String, dynamic> _$HouseDetailDataToJson(HouseDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'communityName': instance.communityName,
      'fullName': instance.fullName,
      'houseType': instance.houseType,
      'propertyRight': instance.propertyRight,
      'buildArea': instance.buildArea,
      'isHost': instance.isHost,
      'list': instance.list,
    };

InnerHouseDetail _$InnerHouseDetailFromJson(Map<String, dynamic> json) =>
    InnerHouseDetail(
      json['id'] as int,
      json['avatar'] as String,
      json['bindType'] as int,
      json['bindTypeName'] as String,
      json['userName'] as String,
      json['phone'] as String,
    );

Map<String, dynamic> _$InnerHouseDetailToJson(InnerHouseDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'bindType': instance.bindType,
      'bindTypeName': instance.bindTypeName,
      'userName': instance.userName,
      'phone': instance.phone,
    };
