// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_goods_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointGoodsDataDetailData _$PointGoodsDataDetailDataFromJson(
        Map<String, dynamic> json) =>
    PointGoodsDataDetailData(
      json['id'] as int,
      json['exchangeNum'] as int,
      json['limitCount'] as int,
      json['attribute'] as String,
      json['content'] as String,
      json['name'] as String,
      json['picture'] as String,
      json['points'] as int,
      json['stockNum'] as int,
    );

Map<String, dynamic> _$PointGoodsDataDetailDataToJson(
        PointGoodsDataDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exchangeNum': instance.exchangeNum,
      'limitCount': instance.limitCount,
      'attribute': instance.attribute,
      'content': instance.content,
      'name': instance.name,
      'picture': instance.picture,
      'points': instance.points,
      'stockNum': instance.stockNum,
    };
