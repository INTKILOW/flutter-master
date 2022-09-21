// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tel_cate_info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelCateInfoData _$TelCateInfoDataFromJson(Map<String, dynamic> json) =>
    TelCateInfoData(
      (json['data'] as List<dynamic>)
          .map((e) => InnerTelCateInfoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TelCateInfoDataToJson(TelCateInfoData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

InnerTelCateInfoData _$InnerTelCateInfoDataFromJson(
        Map<String, dynamic> json) =>
    InnerTelCateInfoData(
      json['id'] as int,
      json['name'] as String,
      json['phone'] as String,
    );

Map<String, dynamic> _$InnerTelCateInfoDataToJson(
        InnerTelCateInfoData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
    };
