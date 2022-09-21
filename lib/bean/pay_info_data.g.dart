// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayInfoData _$PayInfoDataFromJson(Map<String, dynamic> json) => PayInfoData(
      json['description'] as String,
      json['payAmount'] as String,
      (json['payList'] as List<dynamic>)
          .map((e) => PayInfoTypeListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PayInfoDataToJson(PayInfoData instance) =>
    <String, dynamic>{
      'description': instance.description,
      'payAmount': instance.payAmount,
      'payList': instance.payList,
    };

PayInfoTypeListData _$PayInfoTypeListDataFromJson(Map<String, dynamic> json) =>
    PayInfoTypeListData(
      json['type'] as int,
      json['id'] as int,
    );

Map<String, dynamic> _$PayInfoTypeListDataToJson(
        PayInfoTypeListData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
    };
