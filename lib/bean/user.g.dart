// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['avatar'] as String,
      json['gender'] as int,
      json['isWorker'] as bool,
      json['name'] as String,
      json['phone'] as String,
      json['token'] as String,
      (json['roleList'] as List<dynamic>).map((e) => e as String).toList(),
      json['points'] as int?,
      json['unReadNum'] as int,
      (json['pushTags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'gender': instance.gender,
      'isWorker': instance.isWorker,
      'name': instance.name,
      'phone': instance.phone,
      'token': instance.token,
      'points': instance.points,
      'unReadNum': instance.unReadNum,
      'roleList': instance.roleList,
      'pushTags': instance.pushTags,
    };
