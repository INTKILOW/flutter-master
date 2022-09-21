// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentData _$CommentDataFromJson(Map<String, dynamic> json) => CommentData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) => InnerCommentData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentDataToJson(CommentData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerCommentData _$InnerCommentDataFromJson(Map<String, dynamic> json) =>
    InnerCommentData(
      json['userName'] as String,
      json['avatar'] as String,
      json['content'] as String,
      json['createTime'] as String,
      json['id'] as int,
      json['isMine'] as bool,
    );

Map<String, dynamic> _$InnerCommentDataToJson(InnerCommentData instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'avatar': instance.avatar,
      'content': instance.content,
      'createTime': instance.createTime,
      'id': instance.id,
      'isMine': instance.isMine,
    };
