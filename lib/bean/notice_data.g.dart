// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeData _$NoticeDataFromJson(Map<String, dynamic> json) => NoticeData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) => InnerNoticeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NoticeDataToJson(NoticeData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerNoticeData _$InnerNoticeDataFromJson(Map<String, dynamic> json) =>
    InnerNoticeData(
      json['createTime'] as String,
      json['summary'] as String,
      json['thumbnail'] as String,
      json['title'] as String,
      json['id'] as int,
      json['pv'] as int,
      json['communityName'] as String?,
      json['content'] as String?,
      json['communityId'] as int,
      json['shareLink'] as String?,
    );

Map<String, dynamic> _$InnerNoticeDataToJson(InnerNoticeData instance) =>
    <String, dynamic>{
      'createTime': instance.createTime,
      'summary': instance.summary,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'id': instance.id,
      'communityId': instance.communityId,
      'pv': instance.pv,
      'communityName': instance.communityName,
      'content': instance.content,
      'shareLink': instance.shareLink,
    };
