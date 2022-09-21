// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_goods_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointGoodsData _$PointGoodsDataFromJson(Map<String, dynamic> json) =>
    PointGoodsData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) => InnerPointGoodsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PointGoodsDataToJson(PointGoodsData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerPointGoodsData _$InnerPointGoodsDataFromJson(Map<String, dynamic> json) =>
    InnerPointGoodsData(
      json['id'] as int,
      json['points'] as int,
      json['name'] as String,
      json['thumbnail'] as String,
    );

Map<String, dynamic> _$InnerPointGoodsDataToJson(
        InnerPointGoodsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
    };
