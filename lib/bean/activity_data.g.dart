// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityData _$ActivityDataFromJson(Map<String, dynamic> json) => ActivityData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) => InnerActivityData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivityDataToJson(ActivityData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerActivityData _$InnerActivityDataFromJson(Map<String, dynamic> json) =>
    InnerActivityData(
      json['id'] as int,
      json['address'] as String,
      json['name'] as String,
      json['number'] as int,
      json['thumbnail'] as String,
      json['timeRange'] as String,
      json['status'] as int,
      json['statusValue'] as String,
      json['maxNumber'] as int?,
      json['pv'] as int?,
      json['like'] as int?,
      json['content'] as String?,
      (json['avatarList'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['month'] as String?,
      json['day'] as String?,
      json['communityId'] as int,
      json['shareLink'] as String?,
    );

Map<String, dynamic> _$InnerActivityDataToJson(InnerActivityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'communityId': instance.communityId,
      'address': instance.address,
      'name': instance.name,
      'number': instance.number,
      'thumbnail': instance.thumbnail,
      'timeRange': instance.timeRange,
      'status': instance.status,
      'statusValue': instance.statusValue,
      'maxNumber': instance.maxNumber,
      'pv': instance.pv,
      'like': instance.like,
      'content': instance.content,
      'avatarList': instance.avatarList,
      'month': instance.month,
      'day': instance.day,
      'shareLink': instance.shareLink,
    };
