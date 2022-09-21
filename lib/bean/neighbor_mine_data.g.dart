// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neighbor_mine_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeighborMineData _$NeighborMineDataFromJson(Map<String, dynamic> json) =>
    NeighborMineData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) => InnerNeighborMineData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NeighborMineDataToJson(NeighborMineData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerNeighborMineData _$InnerNeighborMineDataFromJson(
        Map<String, dynamic> json) =>
    InnerNeighborMineData(
      json['avatar'] as String,
      json['content'] as String,
      json['id'] as int,
      json['momentContent'] as String?,
      json['momentId'] as int,
      json['type'] as int,
      json['userName'] as String,
      json['createTime'] as String?,
    );

Map<String, dynamic> _$InnerNeighborMineDataToJson(
        InnerNeighborMineData instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'content': instance.content,
      'id': instance.id,
      'momentContent': instance.momentContent,
      'momentId': instance.momentId,
      'type': instance.type,
      'userName': instance.userName,
      'createTime': instance.createTime,
    };
