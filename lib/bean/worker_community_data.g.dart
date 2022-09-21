// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_community_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkCommunityData _$WorkCommunityDataFromJson(Map<String, dynamic> json) =>
    WorkCommunityData(
      (json['data'] as List<dynamic>)
          .map(
              (e) => InnerWorkCommunityData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkCommunityDataToJson(WorkCommunityData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

InnerWorkCommunityData _$InnerWorkCommunityDataFromJson(
        Map<String, dynamic> json) =>
    InnerWorkCommunityData(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$InnerWorkCommunityDataToJson(
        InnerWorkCommunityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
