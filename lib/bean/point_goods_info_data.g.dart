// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_goods_info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointGoodsInfoData _$PointGoodsInfoDataFromJson(Map<String, dynamic> json) =>
    PointGoodsInfoData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) =>
              InnerPointGoodsInfoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PointGoodsInfoDataToJson(PointGoodsInfoData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerPointGoodsInfoData _$InnerPointGoodsInfoDataFromJson(
        Map<String, dynamic> json) =>
    InnerPointGoodsInfoData(
      json['id'] as int,
      json['communityName'] as String,
      json['goodsName'] as String,
      json['thumbnail'] as String,
      json['orderNo'] as String,
      json['status'] as int,
      json['points'] as int,
      json['createTime'] as String?,
    );

Map<String, dynamic> _$InnerPointGoodsInfoDataToJson(
        InnerPointGoodsInfoData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'communityName': instance.communityName,
      'goodsName': instance.goodsName,
      'thumbnail': instance.thumbnail,
      'orderNo': instance.orderNo,
      'status': instance.status,
      'points': instance.points,
      'createTime': instance.createTime,
    };
