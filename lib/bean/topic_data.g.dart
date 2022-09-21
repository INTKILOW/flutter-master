// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicData _$TopicDataFromJson(Map<String, dynamic> json) => TopicData(
      (json['data'] as List<dynamic>)
          .map((e) => InnerTopicData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopicDataToJson(TopicData instance) => <String, dynamic>{
      'data': instance.data,
    };

InnerTopicData _$InnerTopicDataFromJson(Map<String, dynamic> json) =>
    InnerTopicData(
      json['name'] as String,
      json['id'] as int,
    );

Map<String, dynamic> _$InnerTopicDataToJson(InnerTopicData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
