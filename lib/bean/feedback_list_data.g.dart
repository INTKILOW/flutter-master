// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackListData _$FeedbackListDataFromJson(Map<String, dynamic> json) =>
    FeedbackListData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) => InnerFeedbackListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedbackListDataToJson(FeedbackListData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerFeedbackListData _$InnerFeedbackListDataFromJson(
        Map<String, dynamic> json) =>
    InnerFeedbackListData(
      json['communityName'] as String,
      json['id'] as int,
      json['status'] as int,
      json['type'] as int,
      json['userName'] as String,
      json['remark'] as String,
      (json['mediaList'] as List<dynamic>?)
          ?.map((e) => MediaData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['createTime'] as String,
      json['content'] as String,
      json['phone'] as String,
    );

Map<String, dynamic> _$InnerFeedbackListDataToJson(
        InnerFeedbackListData instance) =>
    <String, dynamic>{
      'communityName': instance.communityName,
      'id': instance.id,
      'status': instance.status,
      'type': instance.type,
      'userName': instance.userName,
      'remark': instance.remark,
      'content': instance.content,
      'phone': instance.phone,
      'mediaList': instance.mediaList,
      'createTime': instance.createTime,
    };
