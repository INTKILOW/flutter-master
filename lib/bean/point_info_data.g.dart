// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointInfoData _$PointInfoDataFromJson(Map<String, dynamic> json) =>
    PointInfoData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) => InnerPointInfoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PointInfoDataToJson(PointInfoData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerPointInfoData _$InnerPointInfoDataFromJson(Map<String, dynamic> json) =>
    InnerPointInfoData(
      json['id'] as int,
      json['points'] as int,
      json['createTime'] as String,
      json['name'] as String?,
      json['dir'] as int,
    );

Map<String, dynamic> _$InnerPointInfoDataToJson(InnerPointInfoData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
      'dir': instance.dir,
      'createTime': instance.createTime,
      'name': instance.name,
    };
