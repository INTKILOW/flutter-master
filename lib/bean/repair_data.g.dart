// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairData _$RepairDataFromJson(Map<String, dynamic> json) => RepairData(
      json['hasNextPage'] as bool,
      (json['list'] as List<dynamic>)
          .map((e) => InnerRepairData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RepairDataToJson(RepairData instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };

InnerRepairData _$InnerRepairDataFromJson(Map<String, dynamic> json) =>
    InnerRepairData(
      json['id'] as int,
    );

Map<String, dynamic> _$InnerRepairDataToJson(InnerRepairData instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
