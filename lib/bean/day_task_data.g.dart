// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayTaskData _$DayTaskDataFromJson(Map<String, dynamic> json) => DayTaskData(
      json['taskDate'] as String,
      json['taskName'] as String,
      json['taskTypeName'] as String,
      json['taskId'] as int,
      json['dateId'] as int,
      json['deviceName'] as String,
      json['devicePosition'] as String,
      json['communityName'] as String,
      json['deviceId'] as int,
      json['taskType'] as String,
      json['deviceCode'] as String,
    );

Map<String, dynamic> _$DayTaskDataToJson(DayTaskData instance) =>
    <String, dynamic>{
      'taskDate': instance.taskDate,
      'taskName': instance.taskName,
      'taskTypeName': instance.taskTypeName,
      'taskId': instance.taskId,
      'dateId': instance.dateId,
      'deviceName': instance.deviceName,
      'devicePosition': instance.devicePosition,
      'communityName': instance.communityName,
      'deviceId': instance.deviceId,
      'taskType': instance.taskType,
      'deviceCode': instance.deviceCode,
    };
