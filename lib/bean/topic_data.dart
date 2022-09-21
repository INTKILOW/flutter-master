import 'package:json_annotation/json_annotation.dart';
part 'topic_data.g.dart';

@JsonSerializable()
class TopicData {
  final List<InnerTopicData> data;

  TopicData(this.data);

  factory TopicData.fromJson(Map<String, dynamic> json) =>
      _$TopicDataFromJson(json);

  Map<String, dynamic> toJson() => _$TopicDataToJson(this);
}

@JsonSerializable()
class InnerTopicData {

  final String name;
  final int id;


  InnerTopicData(this.name, this.id);
  factory InnerTopicData.fromJson(Map<String, dynamic> json) =>
      _$InnerTopicDataFromJson(json);

  Map<String, dynamic> toJson() => _$InnerTopicDataToJson(this);
}
