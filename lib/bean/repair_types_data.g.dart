// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_types_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairTypesData _$RepairTypesDataFromJson(Map<String, dynamic> json) =>
    RepairTypesData(
      (json['data'] as List<dynamic>)
          .map((e) => InnerRepairTypesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RepairTypesDataToJson(RepairTypesData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

InnerRepairTypesData _$InnerRepairTypesDataFromJson(
        Map<String, dynamic> json) =>
    InnerRepairTypesData(
      json['icon'] as String,
      json['name'] as String,
      json['id'] as int,
      json['selectIcon'] as String,
    );

Map<String, dynamic> _$InnerRepairTypesDataToJson(
        InnerRepairTypesData instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
      'id': instance.id,
      'selectIcon': instance.selectIcon,
    };
