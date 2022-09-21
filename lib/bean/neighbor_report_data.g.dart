// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neighbor_report_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeighborReportData _$NeighborReportDataFromJson(Map<String, dynamic> json) =>
    NeighborReportData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) =>
              InnerNeighborReportData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NeighborReportDataToJson(NeighborReportData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerNeighborReportData _$InnerNeighborReportDataFromJson(
        Map<String, dynamic> json) =>
    InnerNeighborReportData(
      json['reason'] as String,
      json['createTime'] as String,
      json['phone'] as String,
      json['id'] as int,
      json['momentId'] as int,
    );

Map<String, dynamic> _$InnerNeighborReportDataToJson(
        InnerNeighborReportData instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'createTime': instance.createTime,
      'phone': instance.phone,
      'id': instance.id,
      'momentId': instance.momentId,
    };
