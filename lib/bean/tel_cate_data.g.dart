// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tel_cate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelCateData _$TelCateDataFromJson(Map<String, dynamic> json) => TelCateData(
      (json['data'] as List<dynamic>)
          .map((e) => InnerTelCateData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TelCateDataToJson(TelCateData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

InnerTelCateData _$InnerTelCateDataFromJson(Map<String, dynamic> json) =>
    InnerTelCateData(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$InnerTelCateDataToJson(InnerTelCateData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
