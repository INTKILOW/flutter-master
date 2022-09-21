// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairDetailData _$RepairDetailDataFromJson(Map<String, dynamic> json) =>
    RepairDetailData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) => InnerRepairDetailData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RepairDetailDataToJson(RepairDetailData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerRepairDetailData _$InnerRepairDetailDataFromJson(
        Map<String, dynamic> json) =>
    InnerRepairDetailData(
      json['id'] as int,
      json['content'] as String,
      json['communityName'] as String,
      json['createTime'] as String,
      json['expectedTime'] as String,
      json['houseName'] as String,
      json['inWarranty'] as bool,
      (json['mediaList'] as List<dynamic>?)
          ?.map((e) => MediaData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['nodeId'] as int,
      json['origin'] as int,
      json['overHour'] as int,
      json['nodeName'] as String,
      json['orderNo'] as String,
      json['phone'] as String,
      json['userName'] as String,
      json['positionName'] as String,
      (json['processList'] as List<dynamic>?)
          ?.map((e) => InnerProcessData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['action'] as String,
      json['isEvaluate'] as bool,
    );

Map<String, dynamic> _$InnerRepairDetailDataToJson(
        InnerRepairDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'communityName': instance.communityName,
      'createTime': instance.createTime,
      'expectedTime': instance.expectedTime,
      'houseName': instance.houseName,
      'inWarranty': instance.inWarranty,
      'mediaList': instance.mediaList,
      'nodeId': instance.nodeId,
      'origin': instance.origin,
      'overHour': instance.overHour,
      'nodeName': instance.nodeName,
      'orderNo': instance.orderNo,
      'phone': instance.phone,
      'userName': instance.userName,
      'positionName': instance.positionName,
      'action': instance.action,
      'isEvaluate': instance.isEvaluate,
      'processList': instance.processList,
    };

InnerProcessData _$InnerProcessDataFromJson(Map<String, dynamic> json) =>
    InnerProcessData(
      json['content'] as String,
      json['createTime'] as String,
      json['remark'] as String,
      json['title'] as String,
      json['userName'] as String,
      json['id'] as int,
      (json['mediaList'] as List<dynamic>?)
          ?.map((e) => MediaData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['score'] as int,
    );

Map<String, dynamic> _$InnerProcessDataToJson(InnerProcessData instance) =>
    <String, dynamic>{
      'content': instance.content,
      'createTime': instance.createTime,
      'remark': instance.remark,
      'title': instance.title,
      'userName': instance.userName,
      'id': instance.id,
      'mediaList': instance.mediaList,
      'score': instance.score,
    };
