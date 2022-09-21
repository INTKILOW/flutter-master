// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neighbor_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeighborData _$NeighborDataFromJson(Map<String, dynamic> json) => NeighborData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) => InnerNeighborData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NeighborDataToJson(NeighborData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerNeighborData _$InnerNeighborDataFromJson(Map<String, dynamic> json) =>
    InnerNeighborData(
      json['createTime'] as String,
      json['avatar'] as String,
      json['commentCount'] as int,
      json['id'] as int,
      json['isHot'] as int,
      json['likeCount'] as int,
      json['mediaType'] as int,
      json['communityName'] as String,
      json['topicName'] as String,
      json['userName'] as String,
      (json['mediaList'] as List<dynamic>?)
          ?.map((e) => MediaData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['content'] as String,
      (json['likeList'] as List<dynamic>?)
          ?.map((e) => MediaData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isLike'] as bool,
      json['isMine'] as bool,
    );

Map<String, dynamic> _$InnerNeighborDataToJson(InnerNeighborData instance) =>
    <String, dynamic>{
      'createTime': instance.createTime,
      'avatar': instance.avatar,
      'commentCount': instance.commentCount,
      'id': instance.id,
      'isHot': instance.isHot,
      'likeCount': instance.likeCount,
      'mediaType': instance.mediaType,
      'communityName': instance.communityName,
      'topicName': instance.topicName,
      'userName': instance.userName,
      'mediaList': instance.mediaList,
      'content': instance.content,
      'likeList': instance.likeList,
      'isLike': instance.isLike,
      'isMine': instance.isMine,
    };
