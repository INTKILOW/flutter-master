// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityData _$CommunityDataFromJson(Map<String, dynamic> json) =>
    CommunityData(
      (json['data'] as List<dynamic>)
          .map((e) => InnerCommunityData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommunityDataToJson(CommunityData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

InnerCommunityData _$InnerCommunityDataFromJson(Map<String, dynamic> json) =>
    InnerCommunityData(
      json['id'] as int,
      json['address'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$InnerCommunityDataToJson(InnerCommunityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'name': instance.name,
    };
