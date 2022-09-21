// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppVersionData _$AppVersionDataFromJson(Map<String, dynamic> json) =>
    AppVersionData(
      json['androidUrl'] as String,
      json['iosUrl'] as String,
      json['content'] as String,
      json['versionCode'] as String,
      json['force'] as int,
      json['needUpgrade'] as bool,
    );

Map<String, dynamic> _$AppVersionDataToJson(AppVersionData instance) =>
    <String, dynamic>{
      'androidUrl': instance.androidUrl,
      'iosUrl': instance.iosUrl,
      'content': instance.content,
      'versionCode': instance.versionCode,
      'needUpgrade': instance.needUpgrade,
      'force': instance.force,
    };
