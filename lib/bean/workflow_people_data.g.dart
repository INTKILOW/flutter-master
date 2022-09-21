// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_people_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkflowPeopleData _$WorkflowPeopleDataFromJson(Map<String, dynamic> json) =>
    WorkflowPeopleData(
      (json['children'] as List<dynamic>)
          .map((e) =>
              InnerWorkflowPeopleData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkflowPeopleDataToJson(WorkflowPeopleData instance) =>
    <String, dynamic>{
      'children': instance.children,
    };

InnerWorkflowPeopleData _$InnerWorkflowPeopleDataFromJson(
        Map<String, dynamic> json) =>
    InnerWorkflowPeopleData(
      json['id'] as int,
      json['name'] as String,
      json['phone'] as String?,
      (json['children'] as List<dynamic>?)
          ?.map((e) =>
              InnerWorkflowPeopleData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['expand'] as bool?,
      json['postTypeId'] as int?,
    );

Map<String, dynamic> _$InnerWorkflowPeopleDataToJson(
        InnerWorkflowPeopleData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'expand': instance.expand,
      'postTypeId': instance.postTypeId,
      'children': instance.children,
    };
