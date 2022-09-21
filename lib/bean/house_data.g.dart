// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseData _$HouseDataFromJson(Map<String, dynamic> json) => HouseData(
      (json['actualArea'] as num?)?.toDouble(),
      json['fullName'] as String,
      json['communityName'] as String,
      json['communityId'] as int,
      json['id'] as int,
      json['bindType'] as int,
      json['userNum'] as int,
    );

Map<String, dynamic> _$HouseDataToJson(HouseData instance) => <String, dynamic>{
      'actualArea': instance.actualArea,
      'fullName': instance.fullName,
      'communityName': instance.communityName,
      'communityId': instance.communityId,
      'id': instance.id,
      'bindType': instance.bindType,
      'userNum': instance.userNum,
    };
