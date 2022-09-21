// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleData _$ModuleDataFromJson(Map<String, dynamic> json) => ModuleData(
      (json['data'] as List<dynamic>)
          .map((e) => InnerModuleData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModuleDataToJson(ModuleData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

InnerModuleData _$InnerModuleDataFromJson(Map<String, dynamic> json) =>
    InnerModuleData(
      json['icon'] as String,
      json['name'] as String,
      json['subtitle'] as String,
      json['action'] == null
          ? null
          : ActionData.fromJson(json['action'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InnerModuleDataToJson(InnerModuleData instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
      'subtitle': instance.subtitle,
      'action': instance.action,
    };
